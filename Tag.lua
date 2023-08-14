local plrs = game:GetService("Players")

local UI = game:GetObjects("rbxassetid://7437010836")[1]

local cool = {
    {3531401982, "CookieHub - Premium", 2},
    {4321659797, "CookieHub - Premium", 2},
    {180452588, "CookieHub - Premium", 2},
    {4222612058, "CookieHub - Premium", 2},
    {4455703917, "CookieHub - Premium", 2},
    {2843968848, "CookieHub - Premium", 2},
    {45627963, "CookieHub - Premium", 2},
    {1442161073, "CookieHub - Premium", 2},
    {1745077602, "CookieHub - Premium", 2},
    {2018457840, "CookieHub - Premium", 2},
    {4011054110, "CookieHub - Premium", 2},
    {4171996484, "CookieHub - Premium", 2},
    {1575283354, "CookieHub - Premium", 2},
    {3325197459, "CookieHub - Premium", 2},
    {158755558, "CookieHub - Premium", 2},
    {2431709917, "CookieHub - Premium", 2},
    {1048954013, "CookieHub - Premium", 2},
    {3088140034, "CookieHub - Premium", 2},
    {2479021634, "CookieHub - Premium", 2},
    {1484025735, "CookieHub - Premium", 2},
    {4784057224, "CookieHub - Premium", 2},
    {1945495766, "CookieHub - Premium", 2},
    {1820819873, "CookieHub - Premium", 2},
    {2342817059, "CookieHub - Premium", 2},
    {1678248866, "CookieHub - Premium", 2},
    {2278716443, "CookieHub - Premium", 2},
    {2345356365, "CookieHub - Premium", 2},
    {4674112268, "CookieHub - Premium", 2},
    {1779476302, "CookieHub - Premium", 2},
    {983084905, "CookieHub - Premium", 2},
    {3237141798, "CookieHub - Premium", 2},
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
