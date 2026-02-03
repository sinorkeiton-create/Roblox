# Step-by-Step Build (MVP)

This is the **minimal path** to a working prestige-driven tycoon. We’re starting with
clean structure and a simple loop, then scaling.

## 0) Import the scripts from `src/`

Follow `README.md` to create the folders and paste the Lua files into Roblox Studio.

## 1) Create one plot model

In **Workspace**, create:

```
TycoonPlot (Model)
├── PlotBase (Part)
└── Spawn (Part)
```

Then:
- Select the **TycoonPlot** model
- Use **Tag Editor** to add tag: `TycoonPlot`

## 2) First upgrade button (manual)

Create:

```
TycoonPlot
└── Buttons
    └── UpgradeButton (Part)
```

Set `UpgradeButton` properties:
- **Anchored**: true
- **CanCollide**: true
- **Name**: `UpgradeButton`

This will be the first manual upgrade you can interact with.

## 3) Basic test

Press **Play** and confirm:
- You spawn on the plot
- No errors in output

If this works, you’re ready to wire money & upgrades.

## 4) Next steps (in order)

1. Implement `PlotService:AssignPlot(player)` to claim plots.
2. Add currency leaderstats (for quick iteration).
3. Implement `IncomeService` for a basic tick-based payout.
4. Add an upgrade list in `TycoonConfig`.
5. Connect UpgradeButton to a simple purchase check.

