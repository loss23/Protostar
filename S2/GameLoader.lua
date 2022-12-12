local DB = {
    [2788229376] = {
      [1] = "https://raw.githubusercontent.com/loss23/Protostar/main/ScriptDatabase/Collect%20All%20Items%20%5B2788229376%5D.lua"
    }
}

local Scripts = Window:NewTab("Scripts")
local S = Scripts:NewSection("Scripts")

local SDB = DB[game.PlaceId]

for i=1,table.getn(SDB) do
    S:NewButton(i.tostring(),"Funny",function()
        loadstring(game:HttpGet(SDB[i],true))()
    end) 
end
