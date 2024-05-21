---@param e ModSetEXP
function SetEXP(e)
    if not e.self:IsClient() then
        return e
    end

    local boost_next_exp = e.self:GetBucket("boost_next_exp");

	if boost_next_exp == "1" then
        local base_gain = e.set_exp - e.current_exp
        local new_gain = base_gain * 2
        e.return_value = e.current_exp + new_gain
        e.ignore_default = true
        e.self:SetBucket("boost_next_exp", "0")
        e.self:DeleteBucket("boost_next_exp")
        e.self:Message(MT.Experience,"You receive bonus experience for defeating a mighty foe!");
    end

    return e
end