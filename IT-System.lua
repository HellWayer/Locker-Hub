if _G.FastAttack then
    --[[

  "Not The Best FastAttack"

  ██████╗░██╗░░░██╗  ░█████╗░░██╗░░░░░░░██╗███╗░░██╗███████╗██████╗░  ██╗░░░░░░█████╗░░█████╗░██╗░░██╗███████╗██████╗░   ██╗░░██╗██╗░░░██╗██████╗░
  ██╔══██╗╚██╗░██╔╝  ██╔══██╗░██║░░██╗░░██║████╗░██║██╔════╝██╔══██╗  ██║░░░░░██╔══██╗██╔══██╗██║░██╔╝██╔════╝██╔══██╗   ██║░░██║██║░░░██║██╔══██╗
  ██████╦╝░╚████╔╝░  ██║░░██║░╚██╗████╗██╔╝██╔██╗██║█████╗░░██████╔╝  ██║░░░░░██║░░██║██║░░╚═╝█████═╝░█████╗░░██████╔╝   ███████║██║░░░██║██████╦╝
  ██╔══██╗░░╚██╔╝░░  ██║░░██║░░████╔═████║░██║╚████║██╔══╝░░██╔══██╗  ██║░░░░░██║░░██║██║░░██╗██╔═██╗░██╔══╝░░██╔══██╗   ██╔══██║██║░░░██║██╔══██╗
  ██████╦╝░░░██║░░░  ╚█████╔╝░░╚██╔╝░╚██╔╝░██║░╚███║███████╗██║░░██║  ███████╗╚█████╔╝╚█████╔╝██║░╚██╗███████╗██║░░██║   ██║░░██║╚██████╔╝██████╦╝
  ╚═════╝░░░░╚═╝░░░  ░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝  ╚══════╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝   ╚═╝░░╚═╝░╚═════╝░╚═════╝░


  ███████╗██╗███████╗░█████╗░░█████╗░░█████╗░███████╗░██████╗░█████╗░██████╗░░░░██╗░██╗░░█████╗░░█████╗░░█████╗░░█████╗░
  ╚════██║██║╚════██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗██████████╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗
  ░░███╔═╝██║░░███╔═╝███████║██║░░╚═╝███████║█████╗░░╚█████╗░███████║██████╔╝╚═██╔═██╔═╝╚██████║╚██████║╚██████║╚██████║
  ██╔══╝░░██║██╔══╝░░██╔══██║██║░░██╗██╔══██║██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██████████╗░╚═══██║░╚═══██║░╚═══██║░╚═══██║
  ███████╗██║███████╗██║░░██║╚█████╔╝██║░░██║███████╗██████╔╝██║░░██║██║░░██║╚██╔═██╔══╝░█████╔╝░█████╔╝░█████╔╝░█████╔╝
  ╚══════╝╚═╝╚══════╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚═╝░╚═╝░░░░╚════╝░░╚════╝░░╚════╝░░╚════╝░

  ]]

  game.StarterGui:SetCore("SendNotification", {
      Title = "Notification System", 
      Text = "Please Wait: \n✅",
      Duration = 5
  })

  local plr = game.Players.LocalPlayer
  local STOP = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
  local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
  local CbFw = debug.getupvalues(require(game.Players.LocalPlayer.PlayerScripts.CombatFramework))
  local CbFw2 = CbFw[2]

  require(game.ReplicatedStorage.Util.CameraShaker):Stop()

  function GetBlade() 
      local p13 = CbFw2.activeController
      local ret = p13.blades[1]
      if not ret then 
          return 
      end
      while ret.Parent ~= game.Players.LocalPlayer.Character do 
          ret = ret.Parent 
      end
      return ret
  end

  if not shared.orl then 
      shared.orl = STOPRL.wrapAttackAnimationAsync 
  end
  if not shared.cpc then 
      shared.cpc = STOP.play 
  end

  spawn(function()
      while true do task.wait() for i = 1,1 do 
          pcall(function()
              STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
                  local Hits = STOPRL.getBladeHits(b,c,d)
                  if Hits then
                      STOP.play = function() end
                      a:Play(15.25,15.25,15.25)
                      func(Hits)                
                      STOP.play = shared.cpc
                      wait(0.5)
                      a:Stop()
                  end         
                  if Hits then
                      STOP.play = function() end
                      a:Play(1,1,1)
                      func(Hits)
                      STOP.play = shared.cpc
                      wait(0.5)
                      a:Stop()
                  end
              end
              STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
                  local Hits = STOPRL.getBladeHits(b,c,d)
                  if Hits then
                      STOP.play = function() end
                      a:Play(15.25,15.25,15.25)
                      func(Hits)  
                      STOP.play = shared.cpc
                      wait(0.5)
                      a:Stop()
                  end         
                  if Hits then
                      STOP.play = function() end
                      a:Play(0.001,0.001,0.001)
                      func(Hits)
                      STOP.play = shared.cpc
                      wait(0.5)
                      a:Stop()
                  end
              end
              STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
                  local Hits = STOPRL.getBladeHits(b,c,d)
                  if Hits then
                      STOP.play = function() end
                      a:Play(15.25,15.25,15.25)
                      func(Hits)  
                      STOP.play = shared.cpc
                      wait(0.1)
                      a:Stop()
                  end         
                  if Hits then
                      STOP.play = function() end
                      a:Play(0.001,0.001,0.001)
                      func(Hits)
                      STOP.play = shared.cpc
                      wait(0.1)
                      a:Stop()
                  end
              end
              STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
                  local Hits = STOPRL.getBladeHits(b,c,d)
                  if Hits then
                      STOP.play = function() end
                      a:Play(15.25,15.25,15.25)
                      func(Hits)  
                      STOP.play = shared.cpc
                      wait(0.25)
                      a:Stop()
                  end         
                  if Hits then
                      STOP.play = function() end
                      a:Play(0.001,0.001,0.001)
                      func(Hits)
                      STOP.play = shared.cpc
                      wait(0.25)
                      a:Stop()
                  end
              end
          end)
      end end
  end)

  if true or false then
      if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
          game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
      end
      if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
          game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
      end
      game:GetService("ReplicatedStorage").Util.Sound.Storage.Ope.RadioKnife.SwordSwing:Destroy()
      game:GetService("ReplicatedStorage").Util.Sound.Storage.Swing:Destroy()
      game:GetService("ReplicatedStorage").Util.Sound.Storage.Lazy.Hit1:Destroy()
  end

  task.spawn(function()
    if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
      game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
        pcall(function()
          if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
            game.Players.LocalPlayer.Character.Stun.Value = 0
          end
        end)
      end)
    end
  end)

  local anti = {}
  local antikick = {}
  Cd1 = tick() 
  Cd = tick()
  spawn(function()
      while wait() do 
          pcall(function()
              Attack_normal()
              if Cd - tick() > 1 then
                  wait(0.01) 
                  Cd = tick()
              end
              if Cd1 - tick() > .75 then
                  wait(0.05)
                  Cd1 = tick()
              end
              if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                  Attack_FireServer()
                  wait(0.001)
                  AC.animator.anims.basic[1]:Stop()
              end
          end)
      end
  end)


  function Attack_FireServer()
      local AC = CbFw2.activeController
      for i = 1,1 do 
          local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
              plr.Character,
              {plr.Character.HumanoidRootPart},
              50
          )
          local cac = {}
          local hash = {}
          for k, v in pairs(bladehit) do
              if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                  table.insert(cac, v.Parent.HumanoidRootPart)
                  hash[v.Parent] = true
              end
          end
          bladehit = cac
          if #bladehit > 0 then
              local u8 = debug.getupvalue(AC.attack, 5)
              local u9 = debug.getupvalue(AC.attack, 6)
              local u7 = debug.getupvalue(AC.attack, 4)
              local u10 = debug.getupvalue(AC.attack, 7)
              local u12 = (u8 * 798405 + u7 * 727595) % u9
              local u13 = u7 * 798405
              (function()
                  u12 = (u12 * u9 + u13) % 1099511627776
                  u8 = math.floor(u12 / u9)
                  u7 = u12 - u8 * u9
              end)()
              u10 = u10 + 1
              debug.setupvalue(AC.attack, 5, u8)
              debug.setupvalue(AC.attack, 6, u9)
              debug.setupvalue(AC.attack, 4, u7)
              debug.setupvalue(AC.attack, 7, u10)
              pcall(function()
                  if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                      AC.animator.anims.basic[1]:Play(0.001,0.001,0.001)
                      game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetBlade()))
                      game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                      game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                  end
              end)
          end
      end
  end

  function Attack_normal()
      local AC = CbFw2.activeController
      for i = 1,1 do 
          local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
              plr.Character,
              {plr.Character.HumanoidRootPart},
              55
          )
          local cac = {}
          local hash = {}
          for k, v in pairs(bladehit) do
              if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                  table.insert(cac, v.Parent.HumanoidRootPart)
                  hash[v.Parent] = true
              end
          end
          bladehit = cac
          if #bladehit > 0 then
              pcall(function()
                  if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                      if true or false then
                          AC.attacking = false
                          AC.blocking = false
                          AC.focusStart = (1655503339.0980349 ^ 1655503339.0980349 ^ math.huge)
                          AC.increment = 4
                          AC.hitboxMagnitude = 55
                          AC.timeToNextAttack = tick() -(math.huge ^ math.huge ^ math.huge)
                          game:GetService("VirtualUser"):CaptureController()
                          game:GetService("VirtualUser"):ClickButton1(Vector2.new(1300,760))
                      end
                  end
              end)
          end
      end
  end

  while task.wait() do
      return antikick
  end

  while task.wait() do
      return anti
  end
end
