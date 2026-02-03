local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TycoonConfig = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("TycoonConfig"))

local TycoonService = {}
TycoonService.__index = TycoonService

local tycoonStateByUserId = {}

function TycoonService:Init()
	Players.PlayerAdded:Connect(function(player)
		self:CreateTycoonState(player)
	end)

	Players.PlayerRemoving:Connect(function(player)
		tycoonStateByUserId[player.UserId] = nil
	end)
end

function TycoonService:CreateTycoonState(player)
	tycoonStateByUserId[player.UserId] = {
		player = player,
		cash = 0,
		passiveIncome = TycoonConfig.BaseIncomePerTick,
		unlocks = {},
	}
end

function TycoonService:GetState(player)
	return tycoonStateByUserId[player.UserId]
end

function TycoonService:AddCash(player, amount)
	local state = self:GetState(player)
	if not state then
		return
	end

	state.cash = math.max(0, state.cash + amount)
end

return TycoonService

