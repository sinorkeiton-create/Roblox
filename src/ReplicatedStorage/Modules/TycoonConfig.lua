local TycoonConfig = {}

TycoonConfig.CurrencyName = "Cash"
TycoonConfig.BaseIncomePerTick = 5
TycoonConfig.IncomeTickSeconds = 5

TycoonConfig.UpgradeTiers = {
	{
		id = "starter_machine",
		displayName = "Starter Machine",
		cost = 50,
		passiveIncome = 2,
	},
	{
		id = "improved_machine",
		displayName = "Improved Machine",
		cost = 200,
		passiveIncome = 8,
		prerequisite = "starter_machine",
	},
	{
		id = "automation_core",
		displayName = "Automation Core",
		cost = 800,
		passiveIncome = 25,
		prerequisite = "improved_machine",
	},
}

TycoonConfig.Prestige = {
	BaseBonus = 0.05,
	MaxBonus = 1.0,
}

return TycoonConfig

