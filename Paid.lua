local placeId = game.PlaceId
Key = "IT_LOCKER_HUB";
Id = "1059860084768899102";
token = "qYAsda2QgYCMNIeN3MLHHUtUfjFFjGfh2gQhlQJwwAbIANnH2wrE51HEsY3b3lw1iD5X";
loadstring(game:HttpGet("https://raw.githubusercontent.com/HellWayer/Whilelist-Checker/main/Verifyer.lua", true))()
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
