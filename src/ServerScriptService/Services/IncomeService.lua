local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local TycoonConfig = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("TycoonConfig"))
local TycoonService = require(script.Parent:WaitForChild("TycoonService"))

local IncomeService = {}
IncomeService.__index = IncomeService

function IncomeService:Init()
	task.spawn(function()
		while true do
			self:TickIncome()
			task.wait(TycoonConfig.IncomeTickSeconds)
		end
	end)

	Players.PlayerAdded:Connect(function(player)
		self:CreateLeaderstats(player)
	end)
end

function IncomeService:CreateLeaderstats(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local cash = Instance.new("IntValue")
	cash.Name = TycoonConfig.CurrencyName
	cash.Value = 0
	cash.Parent = leaderstats
end

function IncomeService:TickIncome()
	if not RunService:IsServer() then
		return
	end

	for _, player in ipairs(Players:GetPlayers()) do
		local state = TycoonService:GetState(player)
		if state then
			TycoonService:AddCash(player, state.passiveIncome)
			self:SyncLeaderstats(player, state.cash)
		end
	end
end

function IncomeService:SyncLeaderstats(player, cashAmount)
	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then
		return
	end

	local cash = leaderstats:FindFirstChild(TycoonConfig.CurrencyName)
	if cash then
		cash.Value = cashAmount
	end
end

return IncomeService

