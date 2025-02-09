# SAS ZA 4 Calculator
This is a script that accurate calculates the Damage Per Minute (DPM) of every single gun in the game! This means that you no longer need to do the math yourself or memorize good guns and bad guns you may simply use this for all of your calculation needs.
## settings.toml
You can change the settings in the `settings.toml`. Here is a quick guide:
### CALCULATION
1. DamagePerMag - Enables damage per magazine calculation
2. DamagePerMinute - Enables damage per minute calculation
3. DamagePerSecond - Enables damage per second calculation
4. TimeSpentReloading - Enables reload time per minute calculation (NON-FUNCTINAL)
5. TimeSpentShooting - Enables shooting time per minute calculation (NON-FUNCTIONAL)
### GLOBAL_SETTINGS
1. AllAtOnce - Type all the details of your gun in one prompt separated by spaces or one by one as the script asks?
2. FileUsage - Should it use `DefaultIn` and `DefaultOut` as the input file and output files respectively?
3. Logging - Should it log all of your operations in a logbook.toml?
4. DefaultIn - Default input file
5. DefaultOut - Default output file
## Changelog

### 2025/2/09
 - Implemented first iteration of the Reload Time Per Minute and Shooting Time Per Minute formulas. Unfinished
 - Fixed a niche bug where the script would calculate `(60/(Ammunition/RPS)+ReloadTime` instead of `(60/((Ammunition/RPS)+ReloadTime))`
 - Fixed a bug where the script wouldn't assign numbers into number datatypes.
### 2025/2/08
 - Planning a new formula for calculating reload time per minute
 - Fixed a bug where inputting 0 for Effect Damage and Effect Time would result in `1.#INF`
 - Added dates to changelogs
 
## Known Bugs
 - Formula is known to calculate Hotspot, Flamethrower, and in general high RPS weapons' DPM incorrectly
 - Formula is known to output `1.#IND` under very specific conditions
 
## Roadmap
 - Can use files: No
 - Can accurately calculate gun damage: Yes (excluding a few niche bugs)
 - Gun Quality Quotient: No
 - Logging: No
 - UI: No
 - All Formulas Complete: No