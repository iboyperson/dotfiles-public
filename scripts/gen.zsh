#! /bin/zsh

PROJECT_PATH="$(readlink -m $(dirname $0)/..)"
PUBLIC_PATH="$PROJECT_PATH/.public"

includes=()

for role in "${(@f)"$(<$PUBLIC_PATH/whitelist)"}"
do
    echo $role
    includes=("--include /roles/$role" $includes)
done

echo "$includes \\"

