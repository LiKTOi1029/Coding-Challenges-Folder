tinytoml = require("tinytoml"); Settings = tinytoml.parse("settings.toml"); DamagePerMag, DamagePerMinute, DamagePerSecond, AllAtOnce, FileUsage, Logging, NameLogs, DefaultIn, DefaultOut, TimeSpentReloading, TimeSpentShooting, SimulateOrAverage = Settings["CALCULATION"]["DamagePerMag"], Settings["CALCULATION"]["DamagePerMinute"], Settings["CALCULATION"]["DamagePerSecond"], Settings["GLOBAL_SETTINGS"]["AllAtOnce"],  Settings["GLOBAL_SETTINGS"]["FileUsage"], Settings["GLOBAL_SETTINGS"]["Logging"], Settings["GLOBAL_SETTINGS"]["NameLogs"], Settings["GLOBAL_SETTINGS"]["DefaultIn"], Settings["GLOBAL_SETTINGS"]["DefaultOut"], Settings["CALCULATION"]["TimeSpentReloading"], Settings["CALCULATION"]["TimeSpentShooting"], Settings["CALCULATION"]["SimulateOrAverage"]
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
function OutputFormatter(results, Boolean)
	local ParsingString, SolutionsTable = "", {}
	if not Boolean then
		for num2 = 1, results:len(), 1 do
			if results:sub(num2,num2):find("%d") then ParsingString = ParsingString..results:sub(num2,num2) 
			elseif results:sub(num2,num2):find(".") then ParsingString = ParsingString..results:sub(num2,num2)
			else table.insert(SolutionsTable, tonumber(ParsingString):gsub(" ",""):gsub("\n","")); ParsingString = "" end
		end
		return Logger(SolutionsTable)
	else
		return Logger(results)
	end
end
function TimeCalculator(CalcTable, Boolean)
	local IntParser, ShootingVariable, ReloadingVariable = 0, 0, 0
	repeat
		IntParser = IntParser+(CalcTable[2]/CalcTable[3])
		if IntParser+CalcTable[6] > 60 then IntParser, ShootingVariable = IntParser+(60-IntParser), ShootingVariable+(CalcTable[2]/CalcTable[3]); break end
		IntParser = IntParser+CalcTable[6]
		if IntParser+(CalcTable[2]/CalcTable[3]) > 60 then IntParser, ReloadingVariable = IntParser+(60-IntParser), ReloadingVariable+CalcTable[6]; break end
	until true == false
	if Boolean then return ReloadingVariable
	else return ShootingVariable end
end
function Logger(results)
	do Gunnum=Gunnum+1 end; local LogName
	if results then 
		if NameLogs then
			io.write("Please input a name without spaces or symbols: ")
			LogName = io.read()
		else LogName = "Gun" end
		local DamagePerMinute, DamagePerMagazine, DamagePerSecond, TimeSpentReloadingVar, TimeSpentShootingVar = results[1], results[2], results[3], results[4], results[5]
		print(SavingString..Gunnum.."\n")
		print(ReadAll.."\n["..LogName.."_"..Gunnum.."]")
		print("DamagePerMinute="..results[1].."\nDamagePerMagazine="..results[2].."\nDamagePerSecond="..results[3].."\nTimeSpentReloading="..results[4].."\nTimeSpentShooting="..results[5])
		ReadAll, FirstLine = ReadAll.."\n["..LogName.."_"..Gunnum.."]\nDamagePerMinute="..DamagePerMinute.."\nDamagePerMagazine="..DamagePerMagazine.."\nDamagePerSecond="..DamagePerSecond.."\nTimeSpentReloading="..TimeSpentReloadingVar.."\nTimeSpentShooting="..TimeSpentShootingVar.."\n", SavingString..Gunnum.."\n"
	else io.output("logbook.toml"); io.write(FirstLine..ReadAll); io.output(io.stdout); end
	return print(tostring(true))
end
function Begin(CalcTable)
	for num1, _ in ipairs(CalcTable) do CalcTable[num1] = tonumber(CalcTable[num1]) end
	local AnswersTable, ResultsReloading, ResultsShooting = {}
	local MagDumpTime = (CalcTable[2]/CalcTable[3]); local MinuteReloadTime = (60/((MagDumpTime)+CalcTable[6]))
	local DamagePerMagCalc, EffectCalc, DamagePerSecondCalc = (CalcTable[1]*MagDumpTime*CalcTable[4]*CalcTable[5]), 0, (CalcTable[1]/CalcTable[3])*CalcTable[4]*CalcTable[5]
	local TimeSpentShootingCalc, TimeSpentReloadingCalc = MinuteReloadTime*MagDumpTime, MinuteReloadTime*CalcTable[6]
	if pcall(tonumber(CalcTable[8])) and pcall(tonumber(CalcTable[7])) > 0 then EffectCalc = (CalcTable[7]/CalcTable[8]) end
	if DamagePerMinute then table.insert(AnswersTable, ">>[OUTPUT]: Damage Per Minute: "..tostring(MinuteReloadTime*(DamagePerMagCalc+EffectCalc)).."\n") end
	if DamagePerMag then table.insert(AnswersTable, ">>[OUTPUT]: Damage Per Mag: "..tostring(DamagePerMagCalc).."\n") end
	if DamagePerSecond then table.insert(AnswersTable, ">>[OUTPUT]: Damage Per Second: "..tostring(DamagePerSecondCalc).."\n") end
	if TimeSpentReloading and SimulateOrAverage then ResultsReloading = TimeCalculator(CalcTable, true); table.insert(AnswersTable, ">>[OUTPUT]: Time Spent Reloading Per Minute: "..tostring(ResultsReloading).."\n")
	elseif TimeSpentReloading and not SimulateOrAverage then ResultsReloading = TimeSpentReloadingCalc; table.insert(AnswersTable, ">>[OUTPUT]: Time Spent Reloading Per Minute: "..tostring(ResultsReloading).."\n") end
	if TimeSpentShooting and SimulateOrAverage then ResultsShooting = TimeCalculator(CalcTable, false); table.insert(AnswersTable, ">>[OUTPUT]: Time Spend Shooting Per Minute: "..tostring(ResultsShooting).."\n")
	elseif TimeSpentShooting and not SimulateOrAverage then ResultsShooting = TimeSpentShootingCalc; table.insert(AnswersTable, ">>[OUTPUT]: Time Spent Shooting Per Minute: "..tostring(ResultsShooting).."\n") end
	if Logging then local LogTheseNumbers = {MinuteReloadTime*(DamagePerMagCalc+EffectCalc), DamagePerMagCalc, DamagePerSecondCalc, ResultsReloading, ResultsShooting}; OutputFormatter(LogTheseNumbers, true) end
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
	if (choice == "1" or string.upper(choice) == "BEGIN") and not FileUsage then local Answer = BeginSetTableTerminal(choice); print(Answer);
	elseif (choice == "1" or string.upper(choice) == "BEGIN") and FileUsage then print(">[WARNING]: Turn FileUsage off. It isn't implemented as of this time.") end
until choice == "2" or string.upper(choice) == "EXIT"
Logger()