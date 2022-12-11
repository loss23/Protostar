local i = _G.Key

print(i,_G.PassCode)

if i ~= _G.PassCode then
        game.Players.LocalPlayer:Kick("ROT IN HELL")
else
        print("Loading Games")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/loss23/Protostar/main/S2/GameLoader.lua',true))()
end
