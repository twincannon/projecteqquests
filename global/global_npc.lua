affixes = {
    "a fierce ",
    "an armored ",
    "an unyielding "
}

---@param e NPCEventSpawn
function event_spawn(e)
    if not e.self:IsRareSpawn() then
        local name = e.self:GetName()
        if name:find("^a_") or name:find("^an_") then
            if (math.random(1,100) <= 10) then
                local affix = affixes[math.random(#affixes)]

                if name:find("^a_") then
                    e.self:TempName(affix .. name:sub(3))
                elseif name:find("^an_") then
                    e.self:TempName(affix .. name:sub(4))
                end
                
                if affix == "a fierce " then -- Increase max_hit by 33%
                    e.self:ModifyNPCStat("max_hit", tostring(math.ceil(e.self:GetNPCStat("max_hit") * 1.33))) -- Make sure second param is rounded or else it zeroes it out if it's a float
                elseif affix == "an armored " then -- Double AC
                    e.self:ModifyNPCStat("ac", tostring(math.ceil(e.self:GetNPCStat("ac") * 2)))
                elseif affix == "an unyielding " then -- Increase health by 25%
                    e.self:ModifyNPCStat("max_hp", tostring(math.ceil(e.self:GetNPCStat("max_hp") * 1.25)))
                    e.self:Heal()
                end
            end
        end
    end

    -- make it if mob is not rarespawn and has no lastname, then chance for lastname to be like (treasure hoarder) and add a lootdrop to it based on level
    -- e.self:AddLootTable(id)
    -- e.self:GetLootList()


    -- peq_halloween
    if (eq.is_content_flag_enabled("peq_halloween")) then
        -- exclude mounts and pets
        if (e.self:GetCleanName():findi("mount") or e.self:IsPet()) then
            return;
        end

        -- soulbinders
        -- priest of discord
        if (e.self:GetCleanName():findi("soulbinder") or e.self:GetCleanName():findi("priest of discord")) then
            e.self:ChangeRace(eq.ChooseRandom(14,60,82,85));
            e.self:ChangeSize(6);
            e.self:ChangeTexture(1);
            e.self:ChangeGender(2);
        end

        -- Shadow Haven
        -- The Bazaar
        -- The Plane of Knowledge
        -- Guild Lobby
        local halloween_zones = eq.Set { 202, 150, 151, 344 }
        local not_allowed_bodytypes = eq.Set { 11, 60, 66, 67 }
        if (halloween_zones[eq.get_zone_id()] and not_allowed_bodytypes[e.self:GetBodyType()] == nil) then
            e.self:ChangeRace(eq.ChooseRandom(14,60,82,85));
            e.self:ChangeSize(6);
            e.self:ChangeTexture(1);
            e.self:ChangeGender(2);
        end
    end
end

---@param e NPCEventDeath
function event_death(e)
    local group = e.other:CastToClient():GetGroup()
    if (group ~= nil and group:GroupCount() > 0) then -- By default players report having a valid group of groupcount 0
        -- Group kill
        for i = 0, group:GroupCount() - 1 do
            local member = group:GetMember(i)
            if (member.valid and member:IsClient()) then
                local client = member:CastToClient()
                for i=1,#affixes do
                    local name = e.self:GetName()
                    if name:find("^" .. affixes[i]) then
                        client:SetBucket("boost_next_exp", "1")
                    end
                end
            end
        end
    elseif e.other:IsClient() then
        -- Solo kill
        for i=1,#affixes do
            local name = e.self:GetName()
            if name:find("^" .. affixes[i]) then
                e.other:SetBucket("boost_next_exp", "1")
            end
        end
    end

    return 0
end

