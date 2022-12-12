local itemPath = game.Workspace.Ignored.ItemsDrop
local cf = game.Players.LocalPlayer.Character.HumanoidRootPart

for i,v in pairs(itemPath:GetChildren()) do
if v.Name == "Part" then
cf.CFrame = v.CFrame
wait(2)
end
end
