-- ============================================================
-- ScalableMinimap Addon
-- Saves minimap scale and position between sessions
-- ============================================================

-- Saved variables table (loaded from SavedVariables)
ScalableMinimapDB = ScalableMinimapDB or {}

-- Default values (will be overwritten after PLAYER_LOGIN)
local currentScale = 1.2
local posX = -20
local posY = -20
local posPoint = "TOPRIGHT"

-- Save current settings to SavedVariables
local function SaveSettings()
    ScalableMinimapDB.scale = currentScale
    ScalableMinimapDB.posX = posX
    ScalableMinimapDB.posY = posY
end

-- Apply minimap scale
local function ApplyMinimapScale(scale)
    currentScale = scale

    -- Scale the entire minimap cluster as one unit
    MinimapCluster:SetScale(scale)

    SaveSettings()
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99ScalableMinimap:|r scale set to " .. scale)
end

-- Apply minimap position
local function ApplyMinimapPosition()
    MinimapCluster:ClearAllPoints()
    MinimapCluster:SetPoint(posPoint, UIParent, posPoint, posX, posY)
    SaveSettings()
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

    -- Load saved values NOW (correct timing)
    currentScale = ScalableMinimapDB.scale or 1.2
    posX = ScalableMinimapDB.posX or -20
    posY = ScalableMinimapDB.posY or -20

    -- Welcome message with instructions
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99ScalableMinimap loaded.|r")
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99Usage:|r /minimapscale <number>  |  /minimappos <x> <y>")
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99Example:|r /minimapscale 1.4   /minimappos -20 -40")

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

    -- Apply saved settings
    ApplyMinimapScale(currentScale)
    ApplyMinimapPosition()
end)
