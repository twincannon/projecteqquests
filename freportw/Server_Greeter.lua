---@param e NPCEventSay
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello and welcome to Everquest Underground! The server is still very WIP so expect bugs and weird things. Visit us on Discord at discord.gg/WswdAAnhS9 for more information and server files. Would you like to hear about our " .. eq.say_link("What features?", false, "features") .. "?")
	elseif(e.message:findi("features")) then
		e.self:Say("Everquest Underground features two core ideas: the " .. eq.say_link("What underground?", false, "underground") .. " and " .. eq.say_link("Survival crafting?", false, "survival crafting") .. ".")
	elseif(e.message:findi("underground")) then
		e.self:Say("There exists a network of underground areas below Norrath. These areas link to one another, and various entrances and exits can be found in traditional above ground areas. For example, investigate the sewer grate just behind you and around the corner.")
	elseif(e.message:findi("crafting")) then
		e.self:Say("You should find, in your inventory, a Survivalist's Toolbox. This can be used to create a variety of things using scavenged components found throughout the world. Try searching for the word 'survival' in the container to see some examples.")
	end
end