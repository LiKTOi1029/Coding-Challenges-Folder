# SAS ZA 4 Calculator
This is a script that accurate calculates the Damage Per Minute (DPM) of every single gun in the game! This means that you no longer need to do the math yourself or memorize good guns and bad guns you may simply use this for all of your calculation needs.
## settings.toml
You can change the settings in the `settings.toml`. Here is a quick guide:
### CALCULATION
1. DamagePerMag - Enables damage per magazine calculation
2. DamagePerMinute - Enables damage per minute calculation
3. DamagePerSecond - Enables damage per second calculation
4. TimeSpentReloading - Enables reload time per minute calculation
5. TimeSpentShooting - Enables shooting time per minute calculation
6. OneZombie - Enables calculation for damage per enemy (other formulas calculate for total damage per X time)
7. OneProjectile - Enables calculation for single projectile damage (other formulas calculate for total damage per X time)
### GLOBAL_SETTINGS
1. AllAtOnce - Type all the details of your gun in one prompt separated by spaces or one by one as the script asks?
2. FileUsage - Should it use `DefaultIn` and `DefaultOut` as the input file and output files respectively?
3. Logging - Should it log all of your operations in a logbook.toml?
4. NameLogs - Should the script ask the user to name every log made?
5. DefaultIn - Default input file
6. DefaultOut - Default output file
## Changelog
### 2025/2/16
 - Fixed a bug where `Gunnum` in `logbook.toml` doesn't change when I add new logs.
### 2025/2/15
 - Fixed a bug where the ends and beginnings of logs in `logbook.toml` would concatenate
### 2025/2/14
 - Finalizing logging system. First development build is almost ready.
 - Added new option `NameLogs` into `settings.toml` to set the script to automatically name each gun instead of manually prompting for it for every log.
 - Implmented a margin of error calculator for the `ReloadingTimePerMinute` and `ShootingTimePerMinute` to guage how incorrect the calculations were.
### 2025/2/12
 - Implemented logging system. Off by default and not fully functional
 - Planning better Reload Time Per Minute and Shooting Time Per Minute calculation.
### 2025/2/10
 - Implemented second, improved iteration of the Reload Time Per Minute and Shooting Time Per Minute formulas. Unfinished and inaccurate
 - Planned two more brand new formulas in `settings.toml`. Not implemented and unusable at this time.
### 2025/2/09
 - Implemented first iteration of the Reload Time Per Minute and Shooting Time Per Minute formulas. Unfinished
 - Fixed a niche bug where the script would calculate `(60/(Ammunition/RPS)+ReloadTime)` instead of `(60/((Ammunition/RPS)+ReloadTime))`
 - Fixed a bug where the script wouldn't assign numbers into number datatypes.
### 2025/2/08
 - Planning a new formula for calculating reload time per minute
 - Fixed a bug where inputting 0 for Effect Damage and Effect Time would result in `1.#INF`
 - Added dates to changelogs
## Known Bugs
 - If you insert `0` and `` nothing indiscriminately the script will attempt to compare `0` with `nil` throwing an error and crashing the script
 - `logbook.toml` doesn't save `Error Margin` of all `ReloadTimePerMinute` and `ShootingTimePerMinute` calculations
 - The formula is known to calculate the effect damage incredibly inaccurately.
## Roadmap
 - Can use files: No
 - Can accurately calculate gun damage: Yes (excluding a few niche bugs)
 - Gun Quality Quotient: No
 - Logging: Yes (excluding a few common bugs)
 - UI: No
 - All Formulas Complete: No