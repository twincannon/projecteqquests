function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 2) then  
      e.self:MovePC(9, -128, 71,-23, 229); -- Zone: freportw
  end
end
