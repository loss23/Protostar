local i = _G.Key

if i ~= _G.PassCode then
        game.Players.LocalPlayer:Kick("Wrong key dumb fuck")
else
        local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/loss23/Protostar/main/S2/Lib.lua',true))()
        local Window = Library.CreateLib("Protostar || "..game.Players.LocalPlayer.Name, "Ocean")
        
        -- Tabs --
        local Index = Window:NewTab("Index")
        local Code_Tab
        
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
                        [1] = 'https://raw.githubusercontent.com/loss23/Protostar/main/ScriptDatabase/Collect%20All%20Items.lua',
                        [2] = 'https://raw.githubusercontent.com/niqu1337/vertical/main/core/script.lua',
                        [3] = 'https://raw.githubusercontent.com/jynzl/Da-Hood-Gui/main/Da%20Hood%20GUI'
                },
                [286090429] = {
                        [1] = 'https://raw.githubusercontent.com/loss23/Protostar/main/ScriptDatabase/ArsenalGUI.lua'
                },
                [537413528] = {
                        [1] = 'https://raw.githubusercontent.com/1201for/littlegui/main/Build-A-Boat',
                        [2] = 'https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Build%20A%20Boat%20For%20Treasure/Script.lua'
                },
                [185655149] = {
                        [1] = 'https://raw.githubusercontent.com/big-balla-script-maka/free-scripts/main/Bloxburg-Anti-Ban'
                },
        }
        
        local DB_2 = {
                [2788229376] = {
                        [1] = "Collect All Items",
                        [2] = "Aimbot",
                        [3] = "Funny GUI Shit"
                },
                [286090429] = {
                        [1] = "Arsenal GUI shit"
                },
                [537413528] = {
                        [1] = "GUI#1",
                        [2] = "GUI#2"
                },
                [185655149] = {
                        [1] = "GUI#1"
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
        
        
                
        if _G.Code == _G.Codes[1] then
              Code_Tab = Window:NewTab("Developer Console")  
              local v = Code_Tab:NewSection("Dev Tools")
              v:NewButton("Rejoin","Rejoin the game lmao",function()
                    game:GetService("TeleportService"):Teleport(game.PlaceId,game.Players.LocalPlayer)     
              end)
              v:NewButton("Remote Watch","Watches remotes",function()
                    loadstring(game:HttpGet("https://pastebin.com/raw/bCghX33W", true))()
              end)
        end
        
end
