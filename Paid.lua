local placeId = game.PlaceId
Key = "IT_LOCKER_HUB";
Id = "1056892681600634921";
token = "LwhofAJMuwygWshJr2hrfy7bXIrTqog9fQqNepVTD8cBbIHKs6iu2FgtDxLoBsA7LRY9";
loadstring(game:HttpGet("https://raw.githubusercontent.com/HellWayer/Whilelist-Checker/main/Verifyer.lua", true))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HellWayer/Locker-Hub/main/IT-System.lua"))()
if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HellWayer/Locker-Hub/main/BF.lua"))()
    game:GetService("ReplicatedStorage").Util.Sound.Storage.Ope.RadioKnife.SwordSwing:Destroy()
    game:GetService("ReplicatedStorage").Util.Sound.Storage.Swing:Destroy()
    game:GetService("ReplicatedStorage").Util.Sound.Storage.Lazy.Hit1:Destroy()
elseif placeId == 2788229376 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HellWayer/Locker-Hub/main/Dahood.lua"))()
else
    game.Players.LocalPlayer:kick("\n\nMap Not Support\n")
end
