-- Default values
local currentScale = 1.2
local posX = -20
local posY = -20
local posPoint = "TOPRIGHT"

local function ApplyMinimapScale(scale)
    currentScale = scale

    -- Scale ONLY the minimap cluster (the entire minimap block)
    MinimapCluster:SetScale(scale)

    DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99ScalableMinimap:|r scale set to " .. scale)
end

local function ApplyMinimapPosition()
    -- Reposition the minimap cluster
    MinimapCluster:ClearAllPoints()
    MinimapCluster:SetPoint(posPoint, UIParent, posPoint, posX, posY)
end

-- /minimapscale X
SLASH_MINIMAPSCALE1 = "/minimapscale"
SlashCmdList["MINIMAPSCALE"] = function(msg)
    local num = tonumber(msg)
    if num then
        ApplyMinimapScale(num)
        ApplyMinimapPosition()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99Usage:|r /minimapscale <number>")
    end
end

-- /minimappos X Y
SLASH_MINIMAPPOS1 = "/minimappos"
SlashCmdList["MINIMAPPOS"] = function(msg)
    -- Parse two numbers from the command
    local xStr, yStr = string.match(msg or "", "(-?%S+)%s+(-?%S+)")
    local x = tonumber(xStr)
    local y = tonumber(yStr)

    if x and y then
        posX = x
        posY = y
        ApplyMinimapPosition()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99Usage:|r /minimappos <x> <y>")
    end
end

-- Initialization on login
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99ScalableMinimap:|r addon loaded.")

    -- Fix: Zone text stays anchored in the top-right corner
    if MinimapZoneText then
        MinimapZoneText:SetParent(UIParent)
        MinimapZoneText:ClearAllPoints()
        MinimapZoneText:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -60, -10)
    end

    -- Fix: Clock stays anchored in the top-right corner
    if Clock then
        Clock:SetParent(UIParent)
        Clock:ClearAllPoints()
        Clock:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -10, -30)
    end

    ApplyMinimapScale(currentScale)
    ApplyMinimapPosition()
end)
