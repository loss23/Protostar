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
                local bitches = {
  ['HWID'] = "";
  ['IP'] = "";
}
local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "Krnl-Hwid"};
   for i, v in next, hwid_list do
       if decoded.headers[v] then
           bitches.HWID = decoded.headers[v];
           bitches.IP = tostring(game:HttpGetAsync("https://api.ipify.org", true))
           break
       end
   end

table.foreach(bitches, print)
        end)
        
        -------------
end
