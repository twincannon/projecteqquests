function event_click_door(e)
    local door_id = e.door:GetDoorID();
    if (door_id == 2) then
        e.self:MovePC(333, -242, 1439, -23, 257); -- Zone: draniksewersc
    end
end
  