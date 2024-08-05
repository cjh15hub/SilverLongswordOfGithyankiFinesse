SHORTSWORD_SHOUT = "Shout_Silver_Gith_Shortsword"
LONGSWORD_SHOUT = "Shout_Silver_Gith_Longsword"
GREATSWORD_SHOUT = "Shout_Silver_Gith_Greatsword"
SHOUT_MAP = { [SHORTSWORD_SHOUT]=true, [LONGSWORD_SHOUT]=true, [GREATSWORD_SHOUT]=true }

SHORTSWORD_TEMPLATE = "DGM_Silver_Gith_Shortsword_7563c88d-533d-49f9-a31c-d6b7847754af"
LONGSWORD_TEMPLATE = "DGM_Silver_Gith_Longsword_ea1ef034-13de-4d8a-bf70-31acbc231f27"
GREATSWORD_TEMPLATE = "MAG_GreaterSilver_Greatsword_f01c3f5d-c542-420f-86c5-bdddf7819e29"
TEMPLATE_MAP = { [SHORTSWORD_TEMPLATE]=true, [LONGSWORD_TEMPLATE]=true, [GREATSWORD_TEMPLATE]=true }


function HandleSilverSwordSwapBefore(caster, spell)
    local weapon = Osi.GetEquippedItem(caster, "Melee Main Weapon")
    if weapon == nil then
        return
    end

    local templateName = Osi.GetTemplate(weapon)
    -- Ext.Utils.Print("templateName: " .. templateName)

    if TEMPLATE_MAP[templateName] ~= nil then
        targetWeaponToRemove = weapon
        return
    end

    weapon = Osi.GetEquippedItem(caster, "Melee Offhand Weapon")
    if weapon == nil then
        return
    end

    templateName = Osi.GetTemplate(weapon)

    if TEMPLATE_MAP[templateName] ~= nil then
        targetWeaponToRemove = weapon
        return
    end
end

function HandleSilverSwordSwapAfter(caster, spell)
    if targetWeaponToRemove == nil then
        return
    end

    Osi.RequestDelete(targetWeaponToRemove)

    targetWeaponToRemove = nil
end
