spawn(function()
    function liveTP(MoeiCFrame)
        TOWeap = nil
        if game.Players.LocalPlayer.Data.Stats.Defense.Level.Value == 1 then
            game:GetService("Players")["LocalPlayer"].Character:BreakJoints()
            wait(.1)
            local tweenlive = {}
                (function()
                    for i,v in pairs(game:GetService("Players")["LocalPlayer"].Character:GetChildren()) do
                        if v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - MoeiCFrame.Position).Magnitude > 1000 and TOWeap == false then
                            TOWeap = true
                            wait(.1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                            v.HumanoidRootPart.CFrame = MoeiCFrame
                        elseif (v.HumanoidRootPart.Position - MoeiCFrame.Position).Magnitude < 1000 and TOWeap == false then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                            TOWeap = true
                            wait(.1)
                            TP(MoeiCFrame)
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == true and TOWeap == true then
                            TOWeap = false
                            wait(.1)
                            TP(v.HumanoidRootPart.Position * CFrame.new(0,950,0))
                        end
                    end
                end)()
            if not tweenlive then
                return tweenlive
            end
        else
            game.Players.LocalPlayer:Kick("\n\nFastFarm System\nNeed Defense Level = 1\nYour have Defense Level = " .. tostring(game.Players.LocalPlayer.Data.Stats.Defense.Level.Value) .. "\n\n")
        end
    end
    spawn(function()
        pcall(function()
            if TOWeap then
                if game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
            end
        end)
    end)
end)

spawn(function()
    while task.wait() do
        if TOWeap then
            pcall(function()
                if not game:GetService("Workspace").LocalPlayer.Character:FindFirstChild("liveTP") then
                    local Fucker = Instance.new("Part", game.Players.LocalPlayer.Character.HumanoidRootPart)
                    Fucker.Name = "liveTP"
                    Fucker.Parent = false or game.Players.LocalPlayer.Character.HumanoidRootPart
                    Fucker.Anchored = true
                    Fucker.Transparency = .45
                    Fucker.Size = Vector3.new(15,-0.5,15)
                elseif game:GetService("Workspace").LocalPlayer.Character:FindFirstChild("liveTP") then
                    game.Workspace["liveTP"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
                end
            end)
        else
            if game:GetService("Workspace").LocalPlayer.Character:FindFirstChild("liveTP") then
                game:GetService("Workspace").LocalPlayer.Character:FindFirstChild("liveTP"):Destroy()
            end
        end
    end
end)
