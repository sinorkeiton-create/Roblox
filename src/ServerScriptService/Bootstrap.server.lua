local Services = script.Parent:WaitForChild("Services")

local TycoonService = require(Services:WaitForChild("TycoonService"))
local PlotService = require(Services:WaitForChild("PlotService"))
local IncomeService = require(Services:WaitForChild("IncomeService"))

PlotService:Init()
TycoonService:Init()
IncomeService:Init()
