tinytoml = require("tinytoml"); Settings = tinytoml.parse("settings.toml"); DamagePerMag, DamagePerMinute, DamagePerSecond, AllAtOnce, FileUsage, Logging, DefaultIn, DefaultOut, TimeSpentReloading, TimeSpentShooting = Settings["CALCULATION"]["DamagePerMag"], Settings["CALCULATION"]["DamagePerMinute"], Settings["CALCULATION"]["DamagePerSecond"], Settings["GLOBAL_SETTINGS"]["AllAtOnce"],  Settings["GLOBAL_SETTINGS"]["FileUsage"], Settings["GLOBAL_SETTINGS"]["Logging"], Settings["GLOBAL_SETTINGS"]["DefaultIn"], Settings["GLOBAL_SETTINGS"]["DefaultOut"], Settings["CALCULATION"]["TimeSpentReloading"], Settings["CALCULATION"]["TimeSpentShooting"]
if Logging then 
	local File = io.open("logbook.toml", "r"); io.input("logbook.toml"); local FirstLine = io.read("*line"); ReadAll = io.read("*all"); ParserString, SavingString = "", ""
	if not FirstLine then error("Expected \"Gunnum=0\" Instead got nil in \"logbook.toml\" on line 1") end
	if not ReadAll then ReadAll = FirstLine end
	for num1 = 1, FirstLine:len(), 1 do
		if FirstLine:sub(num1,num1):find("%d") then ParserString = ParserString..FirstLine:sub(num1,num1)
		else SavingString = SavingString..FirstLine:sub(num1,num1) end
	end
	Gunnum = tonumber(ParserString)
	io.input(io.stdin)
end
function Logger(results)
	io.write("Please input a name without spaces or symbols: ")
	local LogName = io.read()
	ReadAll = SavingString..Gunnum.."\n"..ReadAll.."\n["..LogName.."_"..Gunnum.."]\n".."Results"..Gunnum.."=true\n"
	io.output("logbook.toml"); io.write(ReadAll); io.output(io.stdout); io.write("True!\n")
	Gunnum=Gunnum+1
	return true
end
function TimeCalculator(CalcTable, Boolean)
	local TimeSpentCalc, ReloadCount, ShootCount = 0, 0, 0
	repeat
		TimeSpentCalc = TimeSpentCalc+((CalcTable[2]/CalcTable[3])+CalcTable[6]); ReloadCount, ShootCount = ReloadCount+CalcTable[6], ShootCount+(CalcTable[2]/CalcTable[3])
	until TimeSpentCalc >= 60
	if TimeSpentCalc > 60 then TimeSpentCalc = TimeSpentCalc-((CalcTable[2]/CalcTable[3])+CalcTable[6]); ReloadCount, ShootCount = ReloadCount-CalcTable[6], ShootCount-(CalcTable[2]/CalcTable[3]) end
	if Boolean then return tostring(ReloadCount)
	elseif not Boolean then return tostring(ShootCount)
	else return tostring(nil) end
end
function Begin(CalcTable)
	for num1, _ in ipairs(CalcTable) do CalcTable[num1] = tonumber(CalcTable[num1]) end
	local AnswersTable = {}
	local MagDumpTime = (CalcTable[2]/CalcTable[3]); local MinuteReloadTime, MinuteMagDumpTime = (60/((MagDumpTime)+CalcTable[6])), (60/(MagDumpTime))
	local DamagePerMagCalc, EffectCalc, DamagePerSecondCalc = (CalcTable[1]*MagDumpTime*CalcTable[4]*CalcTable[5]), 0, (CalcTable[1]/CalcTable[3])*CalcTable[4]*CalcTable[5]
	if CalcTable[7] and CalcTable[8] > 0 then EffectCalc = (CalcTable[7]/CalcTable[8]) end
	if DamagePerMinute then table.insert(AnswersTable, ">>OUTPUT: Damage Per Minute: "..tostring(MinuteReloadTime*(DamagePerMagCalc+EffectCalc)).."\n") end
	if DamagePerMag then table.insert(AnswersTable, ">>OUTPUT: Damage Per Mag: "..tostring(DamagePerMagCalc).."\n") end
	if DamagePerSecond then table.insert(AnswersTable, ">>OUTPUT: Damage Per Second: "..tostring(DamagePerSecondCalc).."\n") end
	if TimeSpentReloading then table.insert(AnswersTable, ">>OUTPUT: Time Spent Reloading Per Minute: "..TimeCalculator(CalcTable, true).."\n") end
	if TimeSpentShooting then table.insert(AnswersTable, ">>OUTPUT: Time Spend Shooting Per Minute: "..TimeCalculator(CalcTable, false).."\n") end
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
	if (choice == "1" or string.upper(choice) == "BEGIN") and FileUsage == false then local Answer = BeginSetTableTerminal(choice); print(Answer); if Logging then Logger(Answer) end
	elseif (choice == "1" or string.upper(choice) == "BEGIN") and FileUsage == true then print(">[WARNING]: Turn FileUsage off. It isn't implemented as of this time.") end 
until choice == "2" or string.upper(choice) == "EXIT"