local CollectionService = game:GetService("CollectionService")

local PlotService = {}
PlotService.__index = PlotService

local plots = {}

function PlotService:Init()
	plots = CollectionService:GetTagged("TycoonPlot")
end

function PlotService:GetAvailablePlot()
	for _, plot in ipairs(plots) do
		if not plot:GetAttribute("OwnerUserId") then
			return plot
		end
	end

	return nil
end

function PlotService:AssignPlot(player)
	local plot = self:GetAvailablePlot()
	if not plot then
		return nil
	end

	plot:SetAttribute("OwnerUserId", player.UserId)
	return plot
end

return PlotService

