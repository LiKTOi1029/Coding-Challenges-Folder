tinytoml = require("tinytoml");
Settings = tinytoml.parse("settings.toml");
DamagePerMag, DamagePerMinute, DamagePerSecond, AllAtOnce, FileUsage, Logging, DefaultIn, DefaultOut = Settings["GLOBAL_SETTINGS"]["DamagePerMag"], Settings["GLOBAL_SETTINGS"]["DamagePerMinute"], Settings["GLOBAL_SETTINGS"]["DamagePerSecond"], Settings["GLOBAL_SETTINGS"]["AllAtOnce"],  Settings["GLOBAL_SETTINGS"]["FileUsage"], Settings["GLOBAL_SETTINGS"]["Logging"], Settings["GLOBAL_SETTINGS"]["DefaultIn"], Settings["GLOBAL_SETTINGS"]["DefaultOut"]
function Begin(CalcTable)
	local MagDumpTime = (CalcTable[2]/CalcTable[3]); local MinuteReloadTime = (60/(MagDumpTime)+CalcTable[6])
	local DamagePerMag = (CalcTable[1]*MagDumpTime*CalcTable[4]*CalcTable[5])
	if CalcTable
end
--[[function BeginSetTableFiler()
	
end--]]
function BeginSetTableTerminal(choice)
	local CalcTable, ParserString, damage, ammunition, rps, pierce, projectiles, reloadtime = {}, ""
	if AllAtOnce == false then
		io.write(">Damage: "); damage = io.read("*l"):gsub("\n",""); table.insert(CalcTable, damage)
		io.write(">Ammunition: "); ammunition = io.read("*l"):gsub("\n",""); table.insert(CalcTable, ammunition)
		io.write(">RPS: "); rps = io.read("*l"):gsub("\n",""); table.insert(CalcTable, rps)
		io.write(">Pierce: "); pierce = io.read("*l"):gsub("\n",""); table.insert(CalcTable, pierce)
		io.write(">Projectiles Per Shot: "); projectiles = io.read("*l"):gsub("\n",""); table.insert(CalcTable, projectiles)
		io.write(">Reload Time: "); reloadtime = io.read("*l"):gsub("\n",""); table.insert(CalcTable, reloadtime)
		io.write(">[OPTIONAL] Effect Damage: "); effectdmg = io.read("*l"):gsub("\n",""); table.insert(CalcTable, effectdmg)
		io.write(">[OPTIONAL] Effect Seconds: "); effectseconds = io.read("*l"):gsub("\n",""); table.insert(CalcTable, effectseconds)
	return Begin(CalcTable)
	else
		io.write(">Damage, Ammunition, RPS, Pierce, Projectiles Per Shot, Reload Time:\n"); choice = io.read("*l"):gsub("\n","")
		for num1 = 1, choice:len(), 1 do
			ParserString = ParserString..choice:sub(num1,num1);
			if ParserString:sub(ParserString:len(),ParserString:len()) == " " then ParserString:gsub(" ",""); table.insert(CalcTable, tonumber(ParserString)); ParserString = "" end
		end
	return Begin(CalcTable)
	end
end
repeat
	io.write("1) BEGIN\n2) EXIT\n")
	local choice = io.read("*l"):gsub("\n","")
	if (choice == "1" or string.upper(choice) == "BEGIN") and FileUsage == false then print(">[OUTPUT]: "..BeginSetTableTerminal(choice))
	elseif (choice == "1" or string.upper(choice) == "BEGIN") and FileUsage == true then print(">[WARNING]: Turn FileUsage off. It isn't implemented as of this time.") end 
until choice == "2" or string.upper(choice) == "EXIT"