now="$(date -I"minutes")" # get current time to minutes
name="$(git config user.name)" # get username of dev
echo "$now $1" >> "$(git rev-parse --show-toplevel)/.tracking/$name" # append entry
