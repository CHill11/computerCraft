if rednet.isOpen() then
    shell.run("getfile",207,"tunnel.lua")
else 
    rednet.open("right")
end
