local i = _G.Key
loadstring(game:HttpGet('https://raw.githubusercontent.com/loss23/Protostar/main/🦶%20👣%20👂%20🦻%20👃/KeyGen.lua',true))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/loss23/Protostar/main/🦶%20👣%20👂%20🦻%20👃/CodeShit.lua',true))()




if _G.DiscordInvite == true then
  syn.request(
   {
       Url = "http://127.0.0.1:6463/rpc?v=1",
       Method = "POST",
       Headers = {
           ["Content-Type"] = "application/json",
           ["origin"] = "https://discord.com",
       },
       Body = game:GetService("HttpService"):JSONEncode(
           {
               ["args"] = {
                   ["code"] = "zkC5vQ7KRM",
               },
               ["cmd"] = "INVITE_BROWSER",
               ["nonce"] = "."
           })
   })      
end

if _G.Code ~= "nil" then
        for i=1,table.getn(_G.Codes) do
                if _G.Code == _G.Codes[i] then
                     print(_G.Code,"SEXY")   
               end
        end
end







if i ~= _G.PassCode then
        game.Players.LocalPlayer:Kick("ROT IN HELL FAG")
else
        
end
