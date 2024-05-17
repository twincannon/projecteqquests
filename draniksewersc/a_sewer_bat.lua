function event_spawn(e)
	if(math.random(1,100) <= 50) then -- 50% chance
		eq.set_timer("roambox", math.random(500,5000));
	end
end

function event_timer(e)
	if e.timer == "roambox" then
		eq.stop_timer("roambox");
		e.self:SetSimpleRoamBox(25.0)
	end
end