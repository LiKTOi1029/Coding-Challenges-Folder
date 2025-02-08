tinytoml = require("tinytoml"); Settings = tinytoml.parse("settings.toml"); DamagePerMag, DamagePerMinute, DamagePerSecond, AllAtOnce, FileUsage, Logging, DefaultIn, DefaultOut, TimeSpentReloading = Settings["CALCULATION"]["DamagePerMag"], Settings["CALCULATION"]["DamagePerMinute"], Settings["CALCULATION"]["DamagePerSecond"], Settings["GLOBAL_SETTINGS"]["AllAtOnce"],  Settings["GLOBAL_SETTINGS"]["FileUsage"], Settings["GLOBAL_SETTINGS"]["Logging"], Settings["GLOBAL_SETTINGS"]["DefaultIn"], Settings["GLOBAL_SETTINGS"]["DefaultOut"], Settings["CALCULATION"]["TimeSpentReloading"]
function Begin(CalcTable)
	for num1, _ in ipairs(CalcTable) do CalcTable[num1] = tonumber(CalcTable[num1]) end
	local AnswersTable = {}
	local MagDumpTime = (CalcTable[2]/CalcTable[3]); local MinuteReloadTime, MinuteMagDumpTime = (60/((MagDumpTime)+CalcTable[6])), (60/(MagDumpTime))
	local DamagePerMagCalc, EffectCalc, DamagePerSecondCalc = (CalcTable[1]*MagDumpTime*CalcTable[4]*CalcTable[5]), 0, (CalcTable[1]/CalcTable[3])*CalcTable[4]*CalcTable[5]
	local TimeSpentReloadingCalc = (MinuteMagDumpTime-MinuteReloadTime)*60; local TimeSpentShootingCalc = nil
	if CalcTable[7] and CalcTable[8] > 0 then EffectCalc = (CalcTable[7]/CalcTable[8]) end
	if DamagePerMinute == true then table.insert(AnswersTable, ">>[OUTPUT]: Damage Per Minute: "..tostring(MinuteReloadTime*(DamagePerMagCalc+EffectCalc)).."\n") end
	if DamagePerMag == true then table.insert(AnswersTable, ">>[OUTPUT]: Damage Per Mag: "..tostring(DamagePerMagCalc).."\n") end
	if DamagePerSecond == true then table.insert(AnswersTable, ">>[OUTPUT]: Damage Per Second: "..tostring(DamagePerSecondCalc).."\n") end
	if TimeSpentReloading == true then table.insert(AnswersTable, ">>[OUTPUT]: Time Spent Reloading Per Minute: "..tostring(TimeSpentReloadingCalc).."\n>>[OUTPUT]: Time Spend Shooting Per Minute: "..tostring(TimeSpentShootingCalc)) end
	local Result = table.concat(AnswersTable); return Result
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
		io.write(">Damage, Ammunition, RPS, Pierce, Projectiles Per Shot, Reload Time, [OPTIONAL] Effect Damage, [OPTIONAL] Effect Seconds:\n"); choice = io.read("*l"):gsub("\n","")
		for num1 = 1, choice:len(), 1 do
			ParserString = ParserString..choice:sub(num1,num1);
			if ParserString:sub(ParserString:len(),ParserString:len()) == " " or ParserString:sub(ParserString:len(),ParserString:len()) == choice:sub(choice:len(),choice:len()) then ParserString:gsub(" ",""); table.insert(CalcTable, tonumber(ParserString)); ParserString = "" end
		end
	return Begin(CalcTable)
	end
end
repeat
	io.write(">1) BEGIN\n>2) EXIT\n")
	local choice = io.read("*l"):gsub("\n","")
	if (choice == "1" or string.upper(choice) == "BEGIN") and FileUsage == false then print(BeginSetTableTerminal(choice))
	elseif (choice == "1" or string.upper(choice) == "BEGIN") and FileUsage == true then print(">[WARNING]: Turn FileUsage off. It isn't implemented as of this time.") end 
until choice == "2" or string.upper(choice) == "EXIT"