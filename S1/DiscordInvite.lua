local function PromptDiscord(Invite, ShowPrompt)
    if not syn then
        return warn('S^X: Synapse X is essential to use this script.')
    end
    
    local function Request()
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
                    ['code'] = Invite,
                },
                ['cmd'] = 'INVITE_BROWSER',
                ['nonce'] = 'UwU'
            })
        })
    end
    
    local function ParseTimestamp(s)
        local function hasFormat(str)
            local has, split = true, str:split('-')
            if #split == 3 then
                for _, v in next, split do
                    if _ ~= 3 then
                        if v:match('%d+') ~= v then
                            has = false
                        end
                    elseif _ == 3 then
                        if v:match('%d+%a%d+:%d+:%d+%+%d+:%d+') ~= v then
                           has = false
                        end
                    end
                end
            else
                has = false
            end
            return has
        end
        if type(s) == 'string' and hasFormat(s) then
            local Year, Month, Day, Hour, Minute, Second, d7, d8 = s:match('(%d+)-(%d+)-(%d+)(%a+%d+):(%d+):(%d+)(%+%d+):(%d+)')
            local Date = {year = Year, month = Month, day = Day, hour = ((Hour:gsub('%a', '') % 24) - 1) % 12 + 1, min = Minute, sec = Second}
            local Newstamp = os.time(Date)
    
            return ('%s/%s/%s at %s:%s %s'):format(Date.month, Date.day, Date.year, Date.hour, Date.min, 0 + Hour:gsub('%D+', '') > 11 and 'PM' or 'AM')
        end
    end
    
    local function getsynassetfromurl(url)
        local File, Raw = 'SynAsset [', syn.request({
            Url = url,
            Method = 'GET'
        }).Body
        if url and type(url) == 'string' and tostring(Raw):find('PNG') then
            for i = 1, 5 do
                File = tostring(File..string.char(math.random(65, 122)))
            end
            File = File..'].png'
            writefile(File, Raw)
            coroutine.wrap(function()
                wait(10)
                if isfile(File) then
                    delfile(File)
                end
            end)()
            task.wait(.1)
            return getsynasset(File)
        end
    end
    
    if Invite and type(Invite) ~= 'string' or type(Invite) == 'string' and not Invite:match('%a') then
        Invite = 'scRamDa46e'
        warn('<-> No Discord invite detected; Set invite to default.')
    end
    
    local Parsed = {} -- { Name: '', NSFW: false/true, Expiry: n/n/n ... 'PM' or 'AM', Inviter: '' }
    if not ShowPrompt or type(ShowPrompt) == 'boolean' and ShowPrompt == false then
        Request()
        return
    end
    
    local ServerInfo = syn.request({
        Url = 'https://ptb.discord.com/api/invites/'..Invite,
        Method = 'GET'
    })

    if ServerInfo.Success then
        ServerInfo = game:GetService('HttpService'):JSONDecode(ServerInfo.Body)
    else
        return warn(ServerInfo.StatusCode, ServerInfo.StatusMessage, '|', ServerInfo.Body)
    end
    
    SI = ServerInfo
    
    Parsed.Name = SI.guild.name
    Parsed.NSFW = SI.guild.nsfw
    
    if not SI.expires_at or SI.expires_at == 'null' then
        Parsed.Expiry = 'Never'
    else
        Parsed.Expiry = ParseTimestamp(SI.expires_at)
    end
    
    if SI.inviter then
        Parsed.Inviter = '<b>'..SI.inviter.username..'</b>'..'#'..SI.inviter.discriminator
    elseif SI.guild['vanity_url_code'] then
        Parsed.Inviter = '<b>Vanity</b> Invite'
    else
        Parsed.Inviter = '<b>Discord</b> Invite'
    end
    
--- local function < Generate le-epic UI >()
    local DiscordInvitePromptv4 = Instance.new('ScreenGui')
    local BG = Instance.new('Frame')
    local TopBar = Instance.new('Frame')
    local UICorner = Instance.new('UICorner')
    local Filler = Instance.new('Frame')
    local Title = Instance.new('TextLabel')
    local UICorner_2 = Instance.new('UICorner')
    local PromptBG = Instance.new('Frame')
    local UICorner_3 = Instance.new('UICorner')
    local Shade = Instance.new('Frame')
    local UICorner_4 = Instance.new('UICorner')
    local Title3 = Instance.new('TextButton')
    local UICorner_5 = Instance.new('UICorner')
    local Info = Instance.new('TextButton')
    local PromptServerName = Instance.new('TextButton')
    local Option1 = Instance.new('TextButton')
    local UICorner_6 = Instance.new('UICorner')
    local Option2 = Instance.new('TextButton')
    local UICorner_7 = Instance.new('UICorner')
    local InfoBG = Instance.new('Frame')
    local UICorner_8 = Instance.new('UICorner')
    local Shade_2 = Instance.new('Frame')
    local UICorner_9 = Instance.new('UICorner')
    local Info_2 = Instance.new('Frame')
    local UICorner_10 = Instance.new('UICorner')
    local Popout1 = Instance.new('Frame')
    local UICorner_11 = Instance.new('UICorner')
    local Inviter = Instance.new('TextLabel')
    local InviterName = Instance.new('TextButton')
    local Popout2 = Instance.new('Frame')
    local UICorner_12 = Instance.new('UICorner')
    local ServerNameLeaderLbl = Instance.new('TextLabel')
    local ServerNameLbl = Instance.new('TextLabel')
    local Popout3 = Instance.new('Frame')
    local UICorner_13 = Instance.new('UICorner')
    local Expiry = Instance.new('TextLabel')
    local ExpiryDate = Instance.new('TextLabel')
    local Popout4 = Instance.new('Frame')
    local UICorner_14 = Instance.new('UICorner')
    local NSFWServerTitle = Instance.new('TextLabel')
    local NSFWServerLbl = Instance.new('TextLabel')
    local Popout5 = Instance.new('Frame')
    local UICorner_15 = Instance.new('UICorner')
    local ServerIconTitle = Instance.new('TextLabel')
    local ServerIconLbl = Instance.new('TextButton')
    local Title2 = Instance.new('TextButton')
    local UICorner_16 = Instance.new('UICorner')
    local SIP = Instance.new('ImageLabel')
    local UICorner_17 = Instance.new('UICorner')
    local SIPLbl = Instance.new('TextLabel')
    local UICorner_18 = Instance.new('UICorner')
    
    DiscordInvitePromptv4.Name = 'DiscordInvitePromptv4'
    syn.protect_gui(DiscordInvitePromptv4)
    DiscordInvitePromptv4.Parent = game:GetService('CoreGui')
    DiscordInvitePromptv4.Enabled = false
    
    BG.Name = 'BG'
    BG.Parent = DiscordInvitePromptv4
    BG.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
    BG.BorderSizePixel = 0
    BG.Position = UDim2.new(0.284158438, 0, 0.217002243, 0)
    BG.Size = UDim2.new(0.431683183, 0, 0.565995514, 0)
    
    TopBar.Name = 'TopBar'
    TopBar.Parent = BG
    TopBar.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
    TopBar.BorderSizePixel = 0
    TopBar.Position = UDim2.new(0, 0, -0.00038906897, 0)
    TopBar.Size = UDim2.new(0.999999881, 0, 0.111786067, 0)
    TopBar.ZIndex = 4
    
    UICorner.Parent = TopBar
    
    Filler.Name = 'Filler'
    Filler.Parent = TopBar
    Filler.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
    Filler.BorderSizePixel = 0
    Filler.Position = UDim2.new(6.99944565e-08, 0, 0.764162421, 0)
    Filler.Size = UDim2.new(0.99999994, 0, 0.235837534, 0)
    Filler.ZIndex = 4
    
    Title.Name = 'Title'
    Title.Parent = TopBar
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(6.99944565e-08, 0, 0, 0)
    Title.Size = UDim2.new(0.997706652, 0, 0.999999821, 0)
    Title.ZIndex = 4
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = 'Discord Invitation Recieved'
    Title.TextColor3 = Color3.fromRGB(142, 146, 151)
    Title.TextSize = 14.000
    
    UICorner_2.Parent = BG
    
    PromptBG.Name = 'PromptBG'
    PromptBG.Parent = BG
    PromptBG.BackgroundColor3 = Color3.fromRGB(30, 31, 35)
    PromptBG.Position = UDim2.new(0.633027434, 0, 0.144807711, 0)
    PromptBG.Size = UDim2.new(0.344036698, 0, 0.818181813, 0)
    PromptBG.ZIndex = 3
    
    UICorner_3.Parent = PromptBG
    
    Shade.Name = 'Shade'
    Shade.Parent = PromptBG
    Shade.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
    Shade.Position = UDim2.new(0.0420369469, 0, 0.133804947, 0)
    Shade.Size = UDim2.new(0.911296368, 0, 0.822479784, 0)
    Shade.ZIndex = 4
    
    UICorner_4.Parent = Shade
    
    Title3.Name = 'Title3'
    Title3.Parent = PromptBG
    Title3.Active = false
    Title3.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
    Title3.Position = UDim2.new(0.0420369469, 0, 0.030927835, 0)
    Title3.Selectable = false
    Title3.Size = UDim2.new(0.911296368, 0, 0.0696867481, 0)
    Title3.ZIndex = 4
    Title3.Font = Enum.Font.SourceSansSemibold
    Title3.Text = '<smallcaps>Prompt</smallcaps>'
    Title3.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title3.TextSize = 16.000
    Title3.TextWrapped = true
    
    UICorner_5.Parent = Title3
    
    Info.Name = 'Info'
    Info.Parent = PromptBG
    Info.Active = false
    Info.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
    Info.BackgroundTransparency = 1.000
    Info.Position = UDim2.new(0.0733333305, 0, 0.137969375, 0)
    Info.Selectable = false
    Info.Size = UDim2.new(0.852548838, 0, 0.141015664, 0)
    Info.ZIndex = 4
    Info.Font = Enum.Font.SourceSans
    Info.Text = 'Do you wish to open the invite for:'
    Info.TextColor3 = Color3.fromRGB(255, 255, 255)
    Info.TextSize = 14.000
    Info.TextWrapped = true
    
    PromptServerName.Name = 'PromptServerName'
    PromptServerName.Parent = PromptBG
    PromptServerName.Active = false
    PromptServerName.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
    PromptServerName.BackgroundTransparency = 1.000
    PromptServerName.ClipsDescendants = true
    PromptServerName.Position = UDim2.new(0.0599999987, 0, 0.428475052, 0)
    PromptServerName.Selectable = false
    PromptServerName.Size = UDim2.new(0.879999995, 0, 0.338675261, 0)
    PromptServerName.ZIndex = 4
    PromptServerName.Font = Enum.Font.SourceSans
    PromptServerName.Text = '<font color=\'#ff5454\'><u><b>aaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</b></u></font> ?'
    PromptServerName.TextColor3 = Color3.fromRGB(255, 255, 255)
    PromptServerName.TextSize = 17.000
    PromptServerName.TextWrapped = true
    PromptServerName.TextYAlignment = Enum.TextYAlignment.Top
    
    Option1.Name = 'Option1'
    Option1.Parent = PromptBG
    Option1.BackgroundColor3 = Color3.fromRGB(79, 220, 124)
    Option1.Position = UDim2.new(0.0733333379, 0, 0.792195857, 0)
    Option1.Size = UDim2.new(0.413333327, 0, 0.0824742243, 0)
    Option1.ZIndex = 5
    Option1.Font = Enum.Font.SourceSansSemibold
    Option1.Text = 'YES'
    Option1.TextColor3 = Color3.fromRGB(0, 0, 0)
    Option1.TextSize = 14.000
    Option1.TextWrapped = true
    
    UICorner_6.Parent = Option1
    
    Option2.Name = 'Option2'
    Option2.Parent = PromptBG
    Option2.BackgroundColor3 = Color3.fromRGB(237, 66, 69)
    Option2.Position = UDim2.new(0.512548804, 0, 0.792195857, 0)
    Option2.Size = UDim2.new(0.413333327, 0, 0.0824742243, 0)
    Option2.ZIndex = 5
    Option2.Font = Enum.Font.SourceSansSemibold
    Option2.Text = 'NO'
    Option2.TextColor3 = Color3.fromRGB(0, 0, 0)
    Option2.TextSize = 14.000
    Option2.TextWrapped = true
    
    UICorner_7.Parent = Option2
    
    InfoBG.Name = 'InfoBG'
    InfoBG.Parent = BG
    InfoBG.BackgroundColor3 = Color3.fromRGB(30, 31, 35)
    InfoBG.Position = UDim2.new(0.0206421316, 0, 0.144807711, 0)
    InfoBG.Size = UDim2.new(0.596330285, 0, 0.818181813, 0)
    InfoBG.ZIndex = 3
    
    UICorner_8.Parent = InfoBG
    
    Shade_2.Name = 'Shade'
    Shade_2.Parent = InfoBG
    Shade_2.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
    Shade_2.Position = UDim2.new(0.0191625748, 0, 0.13796939, 0)
    Shade_2.Size = UDim2.new(0.957760572, 0, 0.818525553, 0)
    Shade_2.ZIndex = 4
    
    UICorner_9.Parent = Shade_2
    
    Info_2.Name = 'Info'
    Info_2.Parent = Shade_2
    Info_2.BackgroundColor3 = Color3.fromRGB(30, 31, 35)
    Info_2.Position = UDim2.new(0.0321262255, 0, 0.0291034784, 0)
    Info_2.Size = UDim2.new(0.299660742, 0, 0.952096581, 0)
    Info_2.ZIndex = 5
    
    UICorner_10.Parent = Info_2
    
    Popout1.Name = 'Popout1'
    Popout1.Parent = Shade_2
    Popout1.BackgroundColor3 = Color3.fromRGB(30, 31, 35)
    Popout1.Position = UDim2.new(0.358641893, 0, 0.0353705622, 0)
    Popout1.Size = UDim2.new(0.607760549, 0, 0.136909574, 0)
    Popout1.ZIndex = 5
    
    UICorner_11.Parent = Popout1
    
    Inviter.Name = 'Inviter'
    Inviter.Parent = Popout1
    Inviter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Inviter.BackgroundTransparency = 1.000
    Inviter.BorderSizePixel = 0
    Inviter.Position = UDim2.new(-0.507667899, 0, 0.0543001145, 0)
    Inviter.Size = UDim2.new(0.429487556, 0, 0.945700407, 0)
    Inviter.ZIndex = 6
    Inviter.Font = Enum.Font.SourceSansSemibold
    Inviter.Text = 'Inviter'
    Inviter.TextColor3 = Color3.fromRGB(255, 255, 255)
    Inviter.TextSize = 14.000
    
    InviterName.Name = 'InviterName'
    InviterName.Parent = Popout1
    InviterName.Active = false
    InviterName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    InviterName.BackgroundTransparency = 1.000
    InviterName.BorderSizePixel = 0
    InviterName.Position = UDim2.new(0.000279076572, 0, 0.0543001145, 0)
    InviterName.Selectable = false
    InviterName.Size = UDim2.new(0.99773258, 0, 0.945700049, 0)
    InviterName.ZIndex = 6
    InviterName.Font = Enum.Font.SourceSansSemibold
    InviterName.Text = '<b>(null)</b>'
    InviterName.TextColor3 = Color3.fromRGB(255, 255, 255)
    InviterName.TextSize = 14.000
    InviterName.TextWrapped = true
    
    Popout2.Name = 'Popout2'
    Popout2.Parent = Shade_2
    Popout2.BackgroundColor3 = Color3.fromRGB(30, 31, 35)
    Popout2.Position = UDim2.new(0.358811498, 0, 0.218003809, 0)
    Popout2.Size = UDim2.new(0.607760549, 0, 0.136909574, 0)
    Popout2.ZIndex = 5
    
    UICorner_12.Parent = Popout2
    
    ServerNameLeaderLbl.Name = 'ServerNameLeaderLbl'
    ServerNameLeaderLbl.Parent = Popout2
    ServerNameLeaderLbl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ServerNameLeaderLbl.BackgroundTransparency = 1.000
    ServerNameLeaderLbl.BorderSizePixel = 0
    ServerNameLeaderLbl.Position = UDim2.new(-0.514554501, 0, 0.0125853913, 0)
    ServerNameLeaderLbl.Size = UDim2.new(0.442702532, 0, 0.987414539, 0)
    ServerNameLeaderLbl.ZIndex = 6
    ServerNameLeaderLbl.Font = Enum.Font.SourceSansSemibold
    ServerNameLeaderLbl.Text = 'Server Name'
    ServerNameLeaderLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    ServerNameLeaderLbl.TextSize = 14.000
    ServerNameLeaderLbl.TextWrapped = true
    
    ServerNameLbl.Name = 'ServerNameLbl'
    ServerNameLbl.Parent = Popout2
    ServerNameLbl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ServerNameLbl.BackgroundTransparency = 1.000
    ServerNameLbl.BorderSizePixel = 0
    ServerNameLbl.Position = UDim2.new(0, 0, 0.0125853913, 0)
    ServerNameLbl.Size = UDim2.new(0.99773258, 0, 0.987415075, 0)
    ServerNameLbl.ZIndex = 6
    ServerNameLbl.Font = Enum.Font.SourceSansSemibold
    ServerNameLbl.Text = '(null)'
    ServerNameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    ServerNameLbl.TextSize = 14.000
    ServerNameLbl.TextWrapped = true
    
    Popout3.Name = 'Popout3'
    Popout3.Parent = Shade_2
    Popout3.BackgroundColor3 = Color3.fromRGB(30, 31, 35)
    Popout3.Position = UDim2.new(0.358641893, 0, 0.405126423, 0)
    Popout3.Size = UDim2.new(0.607760549, 0, 0.136909574, 0)
    Popout3.ZIndex = 5
    
    UICorner_13.Parent = Popout3
    
    Expiry.Name = 'Expiry'
    Expiry.Parent = Popout3
    Expiry.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Expiry.BackgroundTransparency = 1.000
    Expiry.BorderSizePixel = 0
    Expiry.Position = UDim2.new(-0.507667899, 0, 0, 0)
    Expiry.Size = UDim2.new(0.429487556, 0, 0.999999821, 0)
    Expiry.ZIndex = 6
    Expiry.Font = Enum.Font.SourceSansSemibold
    Expiry.Text = 'Expires at'
    Expiry.TextColor3 = Color3.fromRGB(255, 255, 255)
    Expiry.TextSize = 14.000
    
    ExpiryDate.Name = 'ExpiryDate'
    ExpiryDate.Parent = Popout3
    ExpiryDate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ExpiryDate.BackgroundTransparency = 1.000
    ExpiryDate.BorderSizePixel = 0
    ExpiryDate.Position = UDim2.new(0.000279076572, 0, 0, 0)
    ExpiryDate.Size = UDim2.new(0.99773258, 0, 1.00000036, 0)
    ExpiryDate.ZIndex = 6
    ExpiryDate.Font = Enum.Font.SourceSansSemibold
    ExpiryDate.Text = '<u>1/1/1970</u> at <u>1:11</u> PM'
    ExpiryDate.TextColor3 = Color3.fromRGB(255, 255, 255)
    ExpiryDate.TextSize = 16.000
    ExpiryDate.TextWrapped = true
    
    Popout4.Name = 'Popout4'
    Popout4.Parent = Shade_2
    Popout4.BackgroundColor3 = Color3.fromRGB(30, 31, 35)
    Popout4.Position = UDim2.new(0.358641893, 0, 0.58687079, 0)
    Popout4.Size = UDim2.new(0.607760549, 0, 0.136909574, 0)
    Popout4.ZIndex = 5
    
    UICorner_14.Parent = Popout4
    
    NSFWServerTitle.Name = 'NSFWServerTitle'
    NSFWServerTitle.Parent = Popout4
    NSFWServerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NSFWServerTitle.BackgroundTransparency = 1.000
    NSFWServerTitle.BorderSizePixel = 0
    NSFWServerTitle.Position = UDim2.new(-0.527490377, 0, -0.0476512276, 0)
    NSFWServerTitle.Size = UDim2.new(0.46252504, 0, 1.04765046, 0)
    NSFWServerTitle.ZIndex = 6
    NSFWServerTitle.Font = Enum.Font.SourceSansSemibold
    NSFWServerTitle.Text = 'NSFW Server'
    NSFWServerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NSFWServerTitle.TextSize = 14.000
    
    NSFWServerLbl.Name = 'NSFWServerLbl'
    NSFWServerLbl.Parent = Popout4
    NSFWServerLbl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NSFWServerLbl.BackgroundTransparency = 1.000
    NSFWServerLbl.BorderSizePixel = 0
    NSFWServerLbl.Position = UDim2.new(0.000279076572, 0, 0, 0)
    NSFWServerLbl.Size = UDim2.new(0.991125107, 0, 1.00000012, 0)
    NSFWServerLbl.ZIndex = 6
    NSFWServerLbl.Font = Enum.Font.SourceSansSemibold
    NSFWServerLbl.Text = '<b>false</b>'
    NSFWServerLbl.TextColor3 = Color3.fromRGB(255, 0, 0)
    NSFWServerLbl.TextSize = 14.000
    NSFWServerLbl.TextWrapped = true
    
    Popout5.Name = 'Popout5'
    Popout5.Parent = Shade_2
    Popout5.BackgroundColor3 = Color3.fromRGB(30, 31, 35)
    Popout5.Position = UDim2.new(0.358641893, 0, 0.768615186, 0)
    Popout5.Size = UDim2.new(0.607760549, 0, 0.136909574, 0)
    Popout5.ZIndex = 5
    
    UICorner_15.Parent = Popout5
    
    ServerIconTitle.Name = 'ServerIconTitle'
    ServerIconTitle.Parent = Popout5
    ServerIconTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ServerIconTitle.BackgroundTransparency = 1.000
    ServerIconTitle.BorderSizePixel = 0
    ServerIconTitle.Position = UDim2.new(-0.487845391, 0, 0, 0)
    ServerIconTitle.Size = UDim2.new(0.383235037, 0, 0.999999285, 0)
    ServerIconTitle.ZIndex = 6
    ServerIconTitle.Font = Enum.Font.SourceSansSemibold
    ServerIconTitle.Text = 'Server Icon'
    ServerIconTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    ServerIconTitle.TextSize = 14.000
    
    ServerIconLbl.Name = 'ServerIconLbl'
    ServerIconLbl.Parent = Popout5
    ServerIconLbl.Active = false
    ServerIconLbl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ServerIconLbl.BackgroundTransparency = 1.000
    ServerIconLbl.BorderSizePixel = 0
    ServerIconLbl.Position = UDim2.new(0.000279076572, 0, 0, 0)
    ServerIconLbl.Selectable = false
    ServerIconLbl.Size = UDim2.new(0.991125107, 0, 0.999998987, 0)
    ServerIconLbl.ZIndex = 6
    ServerIconLbl.Font = Enum.Font.SourceSansSemibold
    ServerIconLbl.Text = 'Show'
    ServerIconLbl.TextColor3 = Color3.fromRGB(86, 255, 39)
    ServerIconLbl.TextSize = 14.000
    ServerIconLbl.TextWrapped = true
    
    Title2.Name = 'Title2'
    Title2.Parent = InfoBG
    Title2.Active = false
    Title2.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
    Title2.Position = UDim2.new(0.0189599823, 0, 0.030927835, 0)
    Title2.Selectable = false
    Title2.Size = UDim2.new(0.953367114, 0, 0.0696867481, 0)
    Title2.ZIndex = 4
    Title2.Font = Enum.Font.SourceSansSemibold
    Title2.Text = '<smallcaps>Invite Info</smallcaps>'
    Title2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title2.TextSize = 16.000
    Title2.TextWrapped = true
    
    UICorner_16.Parent = Title2
    
    SIP.Name = 'SIP'
    SIP.Parent = BG
    SIP.BackgroundColor3 = Color3.fromRGB(53, 55, 62)
    SIP.Position = UDim2.new(0.275895506, 0, 0.346388757, 0)
    SIP.Size = UDim2.new(0.26309526, 0, 0.414958715, 0)
    SIP.Visible = false
    SIP.ZIndex = 7
    
    UICorner_17.Parent = SIP
    
    SIPLbl.Name = 'SIPLbl'
    SIPLbl.Parent = BG
    SIPLbl.BackgroundColor3 = Color3.fromRGB(17, 17, 20)
    SIPLbl.Position = UDim2.new(0.275895476, 0, 0.346388727, 0)
    SIPLbl.Size = UDim2.new(0.26309526, 0, 0.414958715, 0)
    SIPLbl.Visible = false
    SIPLbl.ZIndex = 7
    SIPLbl.Font = Enum.Font.GothamBold
    SIPLbl.Text = '(null)'
    SIPLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    SIPLbl.TextScaled = true
    SIPLbl.TextWrapped = true
    
    UICorner_18.Parent = SIPLbl
--end

--Generate le-epic UI()

--[==[[--[ --[[ local lIlIlllIIll_IIllIllll
echo "_____/\\\\\\\\\\\_______________________________________________________________________________aaaaaaaa";
echo "a___/\\\/////////\\\_____________________________________________________________________________aaaaaaa";
echo "aa__\//\\\______\///____/\\\\\\\\\________________________________/\\\_________________/\\\\\\\\__aaaaaa";
echo "aaa___\////\\\__________/\\\/////\\\__/\\\\\\\\\________/\\\\\\\\_\///___/\\/\\\\\\____/\\\////\\\_aaaaa";
echo "aaaa______\////\\\______\/\\\\\\\\\\__\////////\\\_____/\\\//////___/\\\_\/\\\////\\\__\//\\\\\\\\\_aaaa";
echo "aaaaa_________\////\\\___\/\\\//////_____/\\\\\\\\\\___/\\\_________\/\\\_\/\\\__\//\\\__\///////\\\_aaa";
echo "aaaaaa__/\\\______\//\\\__\/\\\__________/\\\/////\\\__\//\\\________\/\\\_\/\\\___\/\\\__/\\_____\\\_aa";
echo "aaaaaaa_\///\\\\\\\\\\\/___\/\\\_________\//\\\\\\\\/\\__\///\\\\\\\\_\/\\\_\/\\\___\/\\\_\//\\\\\\\\__a";
echo "aaaaaaaa___\///////////_____\///___________\////////\//_____\////////__\///__\///____\///___\////////___";
]==]--]] lIlIlllIIll_IIllIllll = [[S~=~W~=~Y~=~g~=~e~=~W~=~9~=~1~=~J~=~3~=~J~=~l~=~I~=~H~=~J~=~l~=~Y~=~W~=~R~=~p~=~b~=~m~=~c~=~g~=~d~=~G~=~h~=~p~=~c~=~y~=~w~=~g~=~e~=~W~=~9~=~1~=~J~=~3~=~J~=~l~=~I~=~G~=~J~=~h~=~a~=~2~=~E~=~s~=~I~=~G~=~F~=~u~=~Z~=~C~=~B~=~z~=~a~=~G~=~9~=~1~=~b~=~G~=~Q~=~g~=~a~=~m~=~9~=~p~=~b~=~j~=~o~=~g~=~P~=~C~=~B~=~z~=~Y~=~1~=~J~=~h~=~b~=~U~=~R~=~h~=~N~=~D~=~Z~=~l~=~I~=~D~=~4]]

--- < Dumb Image Handler >
    --<-> Fun Fact: SIP = 'Server Icon Preview'
    local CSip
    if SI.guild.icon and SI.guild.icon ~= 'null' then
        CSip = SIP
        
        SIP.Image = getsynassetfromurl('https://cdn.discordapp.com/icons/'..SI.guild.id..'/'..SI.guild.icon..'.png')
    else
        CSip = SIPLbl
        
        local ABRV, Old = '', SI.guild.name
        for _, v in next, SI.guild.name:split(' ') do
            task.spawn(function()
                ABRV = ABRV..v:sub(1, 1)
            end)
        end

        SIPLbl.Text = ABRV
    end
-- < Dumb Image Handler >()

---local function < Initiate le-epic scripting >()
-- < Animate Intro >
    DiscordInvitePromptv4.Enabled = true

    local function Tween(...)
        return game:GetService('TweenService'):Create(...)
    end
    
    local MDebounce = true
    local Size_Data = {}
    for _, v in next, DiscordInvitePromptv4:GetDescendants() do
        task.spawn(function()
            if v ~= SIPLbl and v ~= SIP and v:IsA('TextLabel') or v:IsA('TextButton') then
                if v.Text:match('<%/%a+>') then
                    v.RichText = true
                end
                Size_Data[v.Name] = {Size = v.Size, CD = v.ClipsDescendants, T = v}
                v.Size = UDim2.new(0, 0, v.Size.Y.Scale, 0)
                v.ClipsDescendants = true
                v.Visible = false
            end
        end)
    end
    
    local OldSize1, OldSize2, OldSize3 = BG.Size, InfoBG.Size, PromptBG.Size
    local BGOpenAnimation = Tween(BG, TweenInfo.new(.25, Enum.EasingStyle.Sine), {Size = OldSize1}):Play()
    BG.Size = UDim2.new(0, 0, 0, 0)
    InfoBG.Size = UDim2.new(0, 0, InfoBG.Size.Y.Scale, 0)
    PromptBG.Size = UDim2.new(0, 0, PromptBG.Size.Y.Scale, 0)
    
    wait(.25)
    
    local InfoBGOpenAnimation = Tween(InfoBG, TweenInfo.new(.2, Enum.EasingStyle.Sine), {Size = OldSize2}):Play()
    local PromptBGOpenAnimation = Tween(PromptBG, TweenInfo.new(.2, Enum.EasingStyle.Sine), {Size = OldSize3}):Play()
    
    wait(.23)
    
    for _, v in next, DiscordInvitePromptv4:GetDescendants() do
        task.spawn(function()
            if v ~= SIPLbl and v ~= SIP and v:IsA('TextLabel') or v:IsA('TextButton') and Size_Data[v.Name] then
                v.Visible = true
                local T = Tween(v, TweenInfo.new(.4, Enum.EasingStyle.Bounce), {Size = Size_Data[v.Name].Size})
                T:Play()
                T.Completed:wait()
                BG.ClipsDescendants = Size_Data[v.Name].CD
            elseif v == Title then
                v.Visible = true
                local T = Tween(v, TweenInfo.new(.25, Enum.EasingStyle.Sine), {Size = Title.Size})
                T:Play()
                T.Completed:wait()
                BG.ClipsDescendants = Size_Data[v.Name].CD
            end
        end)
    end
    task.spawn(function()
        wait(.4)
        MDebounce = false
    end)
-- < Animate Intro >()
    
    local PSN = '<font color="#ff5454"><u><b>'..Parsed.Name..'</b></u></font> ?'
    InviterName.Text = Parsed.Inviter
    ServerNameLbl.Text = Parsed.Name
    ExpiryDate.Text = Parsed.Expiry
    NSFWServerLbl.Text = '<b>'..tostring(Parsed.NSFW)..'</b>'
    ServerIconLbl.Text = 'Show'
    
    if PSN:len() > 100 then
        PromptServerName.Text = '<font color="#ff5454"><u><b>'..Parsed.Name:sub(1, 100)..'</b></u></font> ... ?'
    else
        PromptServerName.Text = PSN
    end
    
    ServerIconLbl.MouseLeave:Connect(function()
        CSip.Visible = false
    end)
    
    ServerIconLbl.MouseEnter:Connect(function()
        CSip.Visible = true
    end)
    
    
    Option1.MouseButton1Click:Connect(function()
        if not MDebounce then
            MDebounce = true
            for _, v in next, DiscordInvitePromptv4:GetDescendants() do
                task.spawn(function()
                    if v:IsA('TextLabel') or v:IsA('TextButton') then
                        v.ClipsDescendants = true
                        v.TextWrapped = false
                        local T = Tween(v, TweenInfo.new(.25, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, v.Size.Y.Scale, 0)})
                        T:Play()
                        T.Completed:wait()
                        v.Visible = false
                    end
                end)
            end
        end
        
        wait(.25)
        
        Tween(BG, TweenInfo.new(.25, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, BG.Size.Y.Scale, 0)}):Play()
        
        wait(.25)
        
        DiscordInvitePromptv4:Destroy()
        
        -- Request()
    end)
    
    Option2.MouseButton1Click:Connect(function()
        if not MDebounce then
            MDebounce = true
            for _, v in next, DiscordInvitePromptv4:GetDescendants() do
                task.spawn(function()
                    if v:IsA('TextLabel') or v:IsA('TextButton') then
                        v.ClipsDescendants = true
                        v.TextWrapped = false
                        local T = Tween(v, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, v.Size.Y.Scale, 0)})
                        T:Play()
                        Tween(v, TweenInfo.new(.3, Enum.EasingStyle.Sine), {Rotation = 360}):Play()
                        T.Completed:wait()
                        v.Visible = false
                    end
                end)
            end
        end
        
        wait(.15)
        
        Tween(BG, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, BG.Size.Y.Scale, 0)}):Play()
        
        wait(.15)
        
        DiscordInvitePromptv4:Destroy()
    end)
--end
--Initiate le-epic scripting()
end

PromptDiscord('zkC5vQ7KRM', true)

--[==[
 - First Argument is the invite.
 - Second argument is whether or not to initiate the prompt UI/process.
--]==]
