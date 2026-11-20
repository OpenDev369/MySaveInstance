warn("============ save start")
for _, chi in ipairs(game:GetDescendants()) do
	chi.Archivable = true
end

-- for _, screen in ipairs(game:GetChildren()) do
-- 	print(screen.Name)
-- end

local Players = game:FindFirstChildOfClass("Players")
-- Players._PlayerGui:Destroy()
if not Players:FindFirstChild("_PlayerGui") then
	local folder = Instance.new("Folder")
	folder.Name = "_PlayerGui"
	for _, screen in ipairs(Players.LocalPlayer.PlayerGui:GetChildren()) do
		local success, m = pcall(function()
			screen:Clone().Parent = folder
		end)
		if not success then
			warn(m)
		end
	end
	folder.Parent = Players
end

local Params = {
	RepoURL = "https://raw.githubusercontent.com/OpenDev369/MySaveInstance/main/",
	SSI = "saveinstance",
}

local synsaveinstance
while true do
	warn("============ save loadstring")
	synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
	
	warn("============ save", synsaveinstance)
	if synsaveinstance then
		break
	else
		task.wait(1)
	end
end

local Options = {
	mode = "full",
	Decompile = true,
	DecompileTimeout = 20,
	-- noscripts = false,
	-- SaveBytecode = true,
	IgnoreNotArchivable = false,
	RemovePlayerCharacters = false,
} -- Documentation here https://luau.github.io/UniversalSynSaveInstance/api/SynSaveInstance
synsaveinstance(Options)
warn("============ save end")