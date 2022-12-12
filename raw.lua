local i = _G.Key

if i ~= _G.PassCode then
        game.Players.LocalPlayer:Kick("Wrong key dumb fuck")
else
        local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/loss23/Protostar/main/S2/Lib.lua',true))()
        local Window = Library.CreateLib("Protostar", "Sentinel")
        
        -- Tabs --
        local Index = Window:NewTab("Index")
        local Code_Tab
        
        if _G.Code == _G.Codes[1] then
              Code_Tab = Window:NewTab(_G.Code)  
              local v = Code_Tab:NewSection("Funny Shit")
              v:NewButton("Rejoin","Rejoin the game lmao",function()
                    game:GetService("TeleportService"):Teleport(game.PlaceId,game.Players.LocalPlayer)     
              end)
              v:NewButton("Remote Watch","Watches remotes",function()
                    loadstring(game:HttpGet("https://pastebin.com/raw/bCghX33W", true))()
              end)
        end
        
        ----------
        
        -- Sections --
        local General = Index:NewSection("General")
        --------------
        
        -- Buttons --
        General:NewButton("IP Check", "This just prints your ip address. Before you ask or bitch about it, no, we don't store it or even take it.", function()
               print(game:HttpGetAsync("https://api.ipify.org", true))
        end)
        -------------
        
        
        local DB = {
                [2788229376] = {
                        [1] = "https://raw.githubusercontent.com/loss23/Protostar/main/ScriptDatabase/Collect%20All%20Items%20%5B2788229376%5D.lua"
                }
        }
        
        local DB_2 = {
                [2788229376] = {
                        [1] = "Collect All Items"
                }        
        }


        local Scripts = Window:NewTab("Scripts")
        local S = Scripts:NewSection("Scripts")
        
        local SDB = DB[game.PlaceId]


        for i=1,table.getn(SDB) do
                S:NewButton(DB_2[game.PlaceId][i],i,function()
                                loadstring(game:HttpGet(SDB[i],true))()
                end) 
        end
        
end
