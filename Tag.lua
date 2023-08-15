--[[
local plrs = game:GetService("Players")

local UI = game:GetObjects("rbxassetid://7437010836")[1]

local cool = {
    {3531401982, "Peruanito.exe ~ Premium", 2},
    {4321659797, "Peruanito.exe ~ Premium", 2},
    {180452588, "Peruanito.exe ~ Premium", 2},
    {4222612058, "Peruanito.exe ~ Premium", 2},
    {4455703917, "Peruanito.exe ~ Premium", 2},
    {2843968848, "Peruanito.exe ~ Premium", 2},
    {45627963, "Peruanito.exe ~ Premium", 2},
    {1442161073, "Peruanito.exe ~ Premium", 2},
    {1745077602, "Peruanito.exe ~ Premium", 2},
    {2018457840, "Peruanito.exe ~ Premium", 2},
    {4011054110, "Peruanito.exe ~ Premium", 2},
    {4171996484, "Peruanito.exe ~ Premium", 2},
    {1575283354, "Peruanito.exe ~ Premium", 2},
    {3325197459, "Peruanito.exe ~ Premium", 2},
    {158755558, "Peruanito.exe ~ Premium", 2},
    {2431709917, "Peruanito.exe ~ Premium", 2},
    {1048954013, "Peruanito.exe ~ Premium", 2},
    {3088140034, "Peruanito.exe ~ Premium", 2},
    {2479021634, "Peruanito.exe ~ Premium", 2},
    {1484025735, "Peruanito.exe ~ Premium", 2},
    {4784057224, "Peruanito.exe ~ Premium", 2},
    {1945495766, "Peruanito.exe ~ Premium", 2},
    {1820819873, "Peruanito.exe ~ Premium", 2},
    {2342817059, "Peruanito.exe ~ Premium", 2},
    {1678248866, "Peruanito.exe ~ Premium", 2},
    {2278716443, "Peruanito.exe ~ Premium", 2},
    {2345356365, "Peruanito.exe ~ Premium", 2},
    {4674112268, "Peruanito.exe ~ Premium", 2},
    {1779476302, "Peruanito.exe ~ Premium", 2},
    {983084905, "Peruanito.exe ~ Premium", 2},
    {3237141798, "Peruanito.exe ~ Premium", 2},
}

local function isCool(player)
    local isCool = false
    local tag
    local num

    for i, v in next, cool do
        if player.UserId == v[1] then
            isCool = true
            tag = v[2]
            num = v[3]
        end
    end

    return {isCool, tag, num}
end

local function ApplyTag(player, text, num)
    local tag = UI:Clone()
    tag.Nameplate.Text = text
    if num == 2 then
        coroutine.wrap(
            function()
                while tag ~= nil do
                    wait()
                    local color = Color3.fromHSV(math.random() % 5 / 5, 1, 1)
                    tag.Nameplate.TextColor3 = color
                end
            end
        )()
    end

    tag.Parent = player.Character:WaitForChild("Head")
end


for _, v in next, game.Players:GetPlayers() do
    if isCool(v)[1] then
        ApplyTag(v, isCool(v)[2], isCool(v)[3])

        v.CharacterAdded:Connect(
            function()
                ApplyTag(v, isCool(v)[2], isCool(v)[3])
            end
        )
    end
end

game.Players.PlayerAdded:Connect(
    function(plr)
        if isCool(plr)[1] then
            plr.CharacterAdded:Connect(
                function()
                    ApplyTag(plr, isCool(plr)[2], isCool(plr)[3])
                end
            )
        end
    end)

]]
