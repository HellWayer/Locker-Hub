local placeId = game.PlaceId
getgenv().Key = "IT_LOCKER_HUB_8987_GIRO_6975_MFIF"
Id = "1056892681600634921"  
token = "LwhofAJMuwygWshJr2hrfy7bXIrTqog9fQqNepVTD8cBbIHKs6iu2FgtDxLoBsA7LRY9"  
loadstring(game:HttpGet("https://raw.githubusercontent.com/HellWayer/Hellwey/main/api.lua", true))()
if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HellWayer/Locker-Hub/main/BF.lua"))()
elseif placeId == 2788229376 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HellWayer/Locker-Hub/main/Dahood.lua"))()
else
    game.Players.LocalPlayer:kick("\n\nMap Not Support\n")
end
