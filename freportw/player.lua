function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 181) then  
      e.self:MovePC(333, -2, 16,-11, 1); -- Zone: draniksewersc
  end
end
