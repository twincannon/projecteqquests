local expeditions = { takc = true, take = true, taka = true }

function event_click_door(e)
  local door_id = e.door:GetDoorID();

  if (door_id == 3) then
    local dz = e.self:GetExpedition()
    if dz.valid and expeditions[dz:GetZoneName()] then
      e.self:MovePCDynamicZone(dz:GetZoneID())
    end
  elseif (door_id == 11) then
    e.self:MovePC(333, 442, 1525, 0, 391); -- Zone: draniksewersc
  end
end
