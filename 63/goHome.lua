--[[
  A versatile GPS program for ComputerCraft that allows saving and tracking 
  multiple waypoints using a JSON file for persistence.
--]]

-- Requires the 'textutils' API for JSON serialization/deserialization
-- Assuming 'textutils' is available globally, typical for ComputerCraft.
local JSON_FILE = "waypoints.json"

-- --- CONFIGURATION ---
local GPS_TIMEOUT = 5     -- Reduced timeout from 10s to 5s
local UPDATE_INTERVAL = 1 -- Time in seconds between screen updates
local tolerance = 0.1     -- Jitter tolerance for distance comparison

-- --- GLOBAL STATE ---
local previousDistance = nil
local lastKnownX, lastKnownY, lastKnownZ = nil, nil, nil 
local waypoints = {}      -- Stores all saved {name, x, y, z} tables
local currentDestination = nil -- The currently selected destination {name, x, y, z}
local selectionMode = false -- Flag to enter waypoint selection UI
local selectorIndex = 1   -- Index for highlighting in selection mode

-- --- FILE UTILITIES ---

-- Saves the current waypoints table to the JSON file
local function save_waypoints()
  -- Using textutils.serialize to convert the Lua table into a JSON string
  local serializedData = textutils.serialize(waypoints) 
  local file = fs.open(JSON_FILE, "w")
  if file then
    file:write(serializedData)
    file:close()
    return true
  end
  return false
end

-- Loads waypoints from the JSON file on startup
local function load_waypoints()
  if fs.exists(JSON_FILE) then
    local file = fs.open(JSON_FILE, "r")
    if file then
      local content = file:readAll()
      file:close()
      
      -- Check if content is non-empty before attempting deserialization
      if content and content ~= "" then
          -- Using pcall to safely handle errors during deserialization
          local success, data = pcall(textutils.unserialize, content)
          if success and type(data) == "table" then
            waypoints = data
          end
      end
    end
  end
  
  -- Set the first loaded waypoint as the default destination
  if #waypoints > 0 then
    currentDestination = waypoints[1]
  end
end


-- --- UI FUNCTIONS ---

-- Prompts user for a location name and saves the current coordinates
local function save_location(x, y, z)
  if not x or not y or not z then
    -- Provide error feedback if coordinates are missing
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor(colors.red)
    print("ERROR: Cannot save location.")
    term.setTextColor(colors.yellow)
    print("No valid GPS coordinates available. Wait for a location lock.")
    term.clear() -- Clear again before returning control to the main loop
    return false -- Signal failure
  end
  
  -- Clear the screen and ask for a name (this blocks the program)
  term.clear()
  term.setCursorPos(1, 1)
  term.setTextColor(colors.yellow)
  print("--- Save Current Location ---")
  term.setTextColor(colors.white)
  print("\nCurrent Coords:")
  print(string.format("X: %d | Y: %d | Z: %d", math.floor(x), math.floor(y), math.floor(z)))
  print("\nEnter a name for this waypoint:")
  
  -- Input will block the program until the user presses Enter
  term.setCursorPos(1, 6)
  local name = read() 
  name = string.gsub(name, "^%s*(.-)%s*$", "%1") -- Trim whitespace
  
  if name == "" then
    name = "Waypoint " .. (#waypoints + 1)
  end

  local newWaypoint = {
    name = name,
    x = math.floor(x),
    y = math.floor(y),
    z = math.floor(z)
  }
  
  table.insert(waypoints, newWaypoint)
  
  if save_waypoints() then
    -- Immediately switch to the new waypoint as the destination
    currentDestination = newWaypoint
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor(colors.lime)
    print("Waypoint saved and set as destination!")
    print("Name: " .. name)
  else
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor(colors.red)
    print("Error saving waypoints file!")
  end
  
  return true -- Signal success
end


-- Displays the main proximity screen
local function display_proximity()
  local width, height = term.getSize() -- Get screen size once

  -- gps.locate() attempts to find the coordinates (x, y, z)
  local x, y, z = gps.locate(GPS_TIMEOUT) 

  -- --- Clear the main dynamic display area (from line 4 up to the line before the status bar) ---
  for i = 4, height - 1 do
    term.setCursorPos(1, i)
    term.clearLine()
  end
  
  -- *** FIX START: Use explicit positioning for each line to prevent wrapping/stacking ***
  
  -- --- 4. Update Global Location State --- 
  if x and y and z then
    lastKnownX, lastKnownY, lastKnownZ = x, y, z
  end

  if currentDestination == nil then
    term.setCursorPos(1, 4)
    term.setTextColor(colors.red)
    print("ERROR: No destination set.")
    term.setCursorPos(1, 5)
    term.setTextColor(colors.yellow)
    print("Press 'S' to save a new waypoint or 'D' to select one.")
  elseif x and y and z then
    -- --- 1. Calculate Distance ---
    local dx = x - currentDestination.x
    local dy = y - currentDestination.y
    local dz = z - currentDestination.z
    local currentDistance = math.sqrt(dx^2 + dy^2 + dz^2)
    local currentDistanceRounded = math.floor(currentDistance)

    -- --- 2. Determine Trend ---
    local trend = "Waiting for data..."
    local trendColor = colors.white

    if previousDistance ~= nil then
      local difference = previousDistance - currentDistance
      
      if difference > tolerance then
        trend = "Getting CLOSER! \u{25b2}" 
        trendColor = colors.lime 
      elseif difference < -tolerance then
        trend = "Getting FURTHER! \u{25bc}" 
        trendColor = colors.red 
      else
        trend = "Stable / At Location"
        trendColor = colors.yellow
      end
    end
    
    -- --- 3. Display Data (Use explicit term.setCursorPos) ---
    term.setCursorPos(1, 4)
    term.setTextColor(colors.white)
    print(string.format("CURRENT COORDS: X: %d | Y: %d | Z: %d", math.floor(x), math.floor(y), math.floor(z)))
    
    term.setCursorPos(1, 5)
    term.setTextColor(colors.cyan)
    print(string.format("DISTANCE:       %d blocks", currentDistanceRounded))
    
    term.setCursorPos(1, 6)
    term.setTextColor(trendColor)
    print("TREND: " .. trend)
    
    -- --- 4. Update State (Previous distance) ---
    previousDistance = currentDistance 
    
    term.setCursorPos(1, 8) -- Skip a line for spacing
    term.setTextColor(colors.gray)
    print("Press 'S' to Save or 'D' to Select Destination.")
    term.setTextColor(colors.white)
  else
    -- Location failed: display error in red
    term.setCursorPos(1, 4)
    term.setTextColor(colors.red)
    print("ERROR: Could not get GPS location.")
    term.setCursorPos(1, 6)
    term.setTextColor(colors.yellow)
    print("- Check GPS Satellite placement/power.")
    term.setTextColor(colors.white)
  end
  
  -- *** FIX END ***
  
  -- -------------------------------------------------------------------
  -- --- 5. PERSISTENT STATUS BAR (Bottom Right) -----------------------
  -- -------------------------------------------------------------------
  
  -- Clear the bottom line first (Line 'height')
  term.setCursorPos(1, height)
  term.clearLine() 
  
  local coordsText = ""
  
  if lastKnownX and lastKnownY and lastKnownZ then
    coordsText = string.format("X:%d Y:%d Z:%d", math.floor(lastKnownX), math.floor(lastKnownY), math.floor(lastKnownZ))
    term.setBackgroundColor(colors.black) 
    term.setTextColor(colors.lime)
  else
    coordsText = "GPS: Searching..."
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.red)
  end

  -- Calculate start position for right-alignment
  local startX = math.max(1, width - #coordsText + 1)
  
  -- This fixes the mispositioned coordinates by ensuring the cursor is correctly set to the absolute last line.
  term.setCursorPos(startX, height)
  print(coordsText)
  
  -- Reset colors for next print cycle
  term.setBackgroundColor(colors.black)
  term.setTextColor(colors.white)
end

-- Displays the waypoint selection UI
local function display_selector()
  term.clear()
  term.setCursorPos(1, 1)
  term.setTextColor(colors.yellow)
  print("--- Select Destination ---")
  term.setTextColor(colors.gray)
  print("Use UP/DOWN. ENTER to select. ESC to cancel.")
  term.setTextColor(colors.white)
  
  if #waypoints == 0 then
    term.setCursorPos(1, 4)
    term.setTextColor(colors.red)
    print("No waypoints saved yet!")
    print("Press 'S' on the main screen to save one.")
    return
  end

  local maxRows = term.getSize() - 3 -- Use most of the screen
  
  for i, waypoint in ipairs(waypoints) do
    local yPos = i + 3
    if yPos > maxRows then break end -- Stop if we run out of screen space

    local displayLine = string.format("%d. %s (X:%d, Z:%d)", 
      i, waypoint.name, waypoint.x, waypoint.z)
      
    term.setCursorPos(1, yPos)
    term.clearLine()

    if i == selectorIndex then
      term.setBackgroundColor(colors.blue)
      term.setTextColor(colors.white)
    else
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
    end
    
    print(displayLine)
  end
  
  -- Reset colors after printing list
  term.setBackgroundColor(colors.black)
  term.setTextColor(colors.white)
end


-- --- INITIALIZATION ---
load_waypoints()

term.clear()
term.setCursorPos(1, 1)
print("--- Base Proximity Finder ---")
term.setTextColor(colors.yellow)

if currentDestination then
    print(string.format("TARGET: %s (X:%d Y:%d Z:%d)", currentDestination.name, currentDestination.x, currentDestination.y, currentDestination.z))
else
    print("TARGET: No destination set.")
end
term.setTextColor(colors.white)

-- Run once immediately to display initial data
local timerID = os.startTimer(UPDATE_INTERVAL) 
if not selectionMode then display_proximity() end


-- --- MAIN LOOP ---
while true do
  local event, p1, p2, p3 = os.pullEvent()
  
  if selectionMode then
    -- Handle input while in SELECTOR MODE
    if event == "key" then
      local key = p1
      
      if key == keys.up then
        selectorIndex = math.max(1, selectorIndex - 1)
        display_selector()
      elseif key == keys.down then
        selectorIndex = math.min(#waypoints, selectorIndex + 1)
        display_selector()
      elseif key == keys.enter then
        if #waypoints > 0 then
          currentDestination = waypoints[selectorIndex]
          previousDistance = nil -- Reset trend tracking
          selectionMode = false -- Exit selector mode
          
          -- Update header with new destination
          term.clear()
          term.setCursorPos(1, 1)
          print("--- Base Proximity Finder ---")
          term.setTextColor(colors.yellow)
          print(string.format("TARGET: %s (X:%d Y:%d Z:%d)", currentDestination.name, currentDestination.x, currentDestination.y, currentDestination.z))
          term.setTextColor(colors.white)
          
          display_proximity() -- Force immediate location update
          timerID = os.startTimer(UPDATE_INTERVAL) -- FIX: Restart timer after selection
        end
      elseif key == keys.escape then
        selectionMode = false -- Exit selector mode
        term.clear()
        display_proximity() -- Force immediate location update
        timerID = os.startTimer(UPDATE_INTERVAL) -- FIX: Restart timer after cancelling
      end
    end
  else
    -- Handle input while in PROXIMITY MODE
    if event == "timer" and p1 == timerID then
      -- It's our update timer: run locate and reset the timer
      display_proximity()
      timerID = os.startTimer(UPDATE_INTERVAL)
      
    elseif event == "key" then
      local key = p1 
      local isHeld = p3

      if key == keys.t then
        break -- Exit on Ctrl+T
      elseif key == keys.s and not isHeld then -- 'S' key: Save current location
        local success = save_location(lastKnownX, lastKnownY, lastKnownZ)
        if success then
           -- Restart timer after blocking read() in save_location
           timerID = os.startTimer(UPDATE_INTERVAL) 
        end
        -- Force screen redraw (header + data) after save_location finishes
        display_proximity() 
      elseif key == keys.d and not isHeld then -- 'D' key: Enter selector mode
        if #waypoints > 0 then
          selectionMode = true
          display_selector()
        else
          -- FIX: Removed sleep(2) here. The next timer event will clear line 12.
          term.setCursorPos(1, 12)
          term.setTextColor(colors.red)
          print("No waypoints saved! Press 'S' to save one.")
        end
      end
    end
  end
end

-- Cleanup screen upon exit
term.clear()
term.setCursorPos(1, 1)
print("Base Proximity Finder stopped.")