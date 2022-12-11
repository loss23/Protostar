local i = _G.Key

print(i,_G.PassCode)

if i ~= _G.PassCode then
        game.Players.LocalPlayer:Kick("ROT IN HELL")
else
        messagebox("Protostar is now loading!","Protostar v1",0)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/loss23/Protostar/main/S2/GameLoader.lua',true))()
end
