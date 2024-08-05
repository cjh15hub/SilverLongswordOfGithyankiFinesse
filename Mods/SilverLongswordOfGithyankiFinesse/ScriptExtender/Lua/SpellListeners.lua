Ext.Require("RemoveSwordShout.lua")

local targetWeaponToRemove = nil

-- UsingSpell
Ext.Osiris.RegisterListener("CastedSpell", 5, "before", function(caster, spell, spellType, spellElement, storyActionID)
    if SHOUT_MAP[spell] ~= nil then
        HandleSilverSwordSwapBefore(caster, spell)
    end
end)

Ext.Osiris.RegisterListener("CastedSpell", 5, "after", function(caster, spell, spellType, spellElement, storyActionID)
    if SHOUT_MAP[spell] ~= nil then
        HandleSilverSwordSwapAfter(caster, spell)
    end
end)
