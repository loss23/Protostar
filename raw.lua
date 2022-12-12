local i = _G.Key

if i ~= _G.PassCode then
        game.Players.LocalPlayer:Kick("ROT IN HELL")
else
        local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/loss23/Protostar/main/S2/Lib.lua',true))()
        local Window = Library.CreateLib("Protostar", "Ocean")
        -- Tabs --
        local Index = Window:NewTab("Index")
        ----------
        
        -- Sections --
        local General = Index:NewSection("General")
        --------------
        
        -- Buttons --
        
        General:NewButton("TEST", "Sexy Test Button", function()
               print(game:HttpGetAsync("https://api.ipify.org", true))
        end)
        
        -------------
end

