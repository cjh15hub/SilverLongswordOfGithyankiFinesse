Ext.Require("Shared/_Init.lua")
--Ext.Require("Shared/Utils.lua")
Ext.Require("SpellListeners.lua")

local function OnSessionLoaded()
    Ext.Utils.Print(TC.modTableKey ..
        " Version: " .. TC.modVersion.major .. '.' .. TC.modVersion.minor .. '.' .. TC.modVersion.revision .. ' Loaded')
end

Ext.Events.SessionLoaded:Subscribe(OnSessionLoaded)
