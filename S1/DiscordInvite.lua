if not syn then    
    game.Players.LocalPlayer:Kick("You gotta use synapse for this script broke bitch")
else

    syn.request(
            {
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    ['origin'] = 'https://discord.com',
                },
                Body = game:GetService('HttpService'):JSONEncode({
                    ['args'] = {
                    ['code'] = "zkC5vQ7KRM",
                },
                ['cmd'] = 'INVITE_BROWSER',
                ['nonce'] = 'ProtostarScript-V1_SEXYSHIT121'
            })
        })
end
