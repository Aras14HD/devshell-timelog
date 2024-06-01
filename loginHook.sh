git pull # get changes to hooks/scripts
/bin/sh "$(git rev-parse --show-toplevel)/.tracking/record.sh" clockin # add clockin entry
rm $(git rev-parse --show-toplevel)/.git/hooks/* # clear git hooks
cp $(git rev-parse --show-toplevel)/.tracking/pre-commit $(git rev-parse --show-toplevel)/.git/hooks # add current git hooks
