# Roblox Tycoon (Prestige-Driven) — Starter Layout

This repo is a **starter blueprint** for the prestige-driven tycoon we described. It gives you
the exact **folders and scripts** to create inside Roblox Studio, plus a clean architecture
to grow from.

## Step 1: Create the Roblox Studio folders

In **Explorer**, create the following structure:

```
ReplicatedStorage
└── Modules
    └── TycoonConfig (ModuleScript)

ServerScriptService
├── Bootstrap (Script)
└── Services
    ├── TycoonService (ModuleScript)
    ├── PlotService (ModuleScript)
    └── IncomeService (ModuleScript)
```

> The **source of truth** for these scripts lives in `src/` in this repo.  
> Copy/paste the contents of each file into the matching script in Studio.

## Step 2: Start with config-first design

Open `src/ReplicatedStorage/Modules/TycoonConfig.lua` and paste it into the ModuleScript
named **TycoonConfig**.

This config is where you’ll define **upgrade costs**, **tiers**, and **progression rules**.

## Step 3: Wire the services

Paste the files from:

- `src/ServerScriptService/Bootstrap.server.lua` → **Bootstrap**
- `src/ServerScriptService/Services/TycoonService.lua` → **TycoonService**
- `src/ServerScriptService/Services/PlotService.lua` → **PlotService**
- `src/ServerScriptService/Services/IncomeService.lua` → **IncomeService**

These modules give you an expandable, clean architecture:

- **TycoonService**: one tycoon per player
- **PlotService**: assign plots, track claim state
- **IncomeService**: active + passive income loop

## Step 4: Next build steps

Once these are in place, the next step is to:

1. Create a **single plot** model in Workspace
2. Add a **Spawn** part and a **CollectionService** tag `TycoonPlot`
3. Connect plots to `PlotService` so players claim a plot on join

See `docs/step-by-step.md` for the full walkthrough.

