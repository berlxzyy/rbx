if not game:IsLoaded() then
    game.Loaded:Wait()
end

local player = game.Players.LocalPlayer
local name = player and player.Name or "Player"

local env = getgenv and getgenv() or _G

env.USED_BEFORE = env.USED_BEFORE or false

if env.USED_BEFORE then
    warn("> Welcome back "..name..", thanks for using this script")
else
    warn("> Hi there "..name..", thanks for using this script")
    env.USED_BEFORE = true
end

if env.FPS_SCRIPT_LOADED then
    warn("Script already executed!")
    return
end

env.FPS_SCRIPT_LOADED = true

local success, err = pcall(function()

    local Terrain = workspace.Terrain
    local Lighting = game:GetService("Lighting")

    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0

    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.Brightness = 0

    for _, child in pairs(workspace:GetDescendants()) do
        if child:IsA("BasePart") and child.Name ~= "Terrain" then
            child.Material = Enum.Material.Plastic
            child.Reflectance = 0
        elseif child:IsA("Decal") or child:IsA("Texture") then
            child:Destroy()
        elseif child:IsA("ParticleEmitter") or child:IsA("Fire") or child:IsA("Smoke") then
            child.Enabled = false
        elseif child:IsA("Explosion") then
            child.Visible = false
        end
    end

end)

if success then
    warn([[
================================
   🚀 ENJOY REDUCE LAG 🚀
================================
]])
else
    warn("It doesnt work somehow:", err)
end
