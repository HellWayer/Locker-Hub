local placeId = game.PlaceId
if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HellWayer/Locker-Hub/main/BF.lua"))()
elseif placeId == 2788229376 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HellWayer/Locker-Hub/main/Dahood.lua"))()
else
    game.Players.LocalPlayer:kick("\n\nMap Not Support\n")
end
