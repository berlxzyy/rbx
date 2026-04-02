if getgenv and getgenv().FPS_SCRIPT_LOADED then
    warn("Script already executed!")
    return
end

if getgenv then
    getgenv().FPS_SCRIPT_LOADED = true
else
    _G.FPS_SCRIPT_LOADED = true
end

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
	print("Enjoy reduce lag")
else
	warn("It doesnt work somehow:", err)
end
