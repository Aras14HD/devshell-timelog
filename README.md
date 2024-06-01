# Timelogger for devshells
This logs the time of login and commit in devshells, the rust script calculates the total time. This was a quick project for myself, so Issues will probably be ignored. Use at your own risk.
## Files
 - [loginHook.sh](loginHook.sh) - what should be run at login of your devshell (shellHook)
 - [.tracking/record.sh](.tracking/record.sh) - the script that actually takes the records (takes in a record type, should be commit or clockin for calculator)
 - [.tracking/pre-commit](.tracking/pre-commit) - git hook that automatically adds commit records
 - [src/main.rs](src/main.rs) - the calculator, is somewhat forgiving (takes in the path to a record)
