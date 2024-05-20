function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 2) then  
      e.self:MovePC(9, -128, 71,-23, 229); -- Zone: freportw
  elseif (door_id == 10) then
    e.self:MovePC(34, -761, -758, 1, 252); -- Zone: nro
  --elseif (door_id == 9) then
  --    e.self:MovePC(256, 350, 290, 21, 122); -- Zone: takf
  end
end
