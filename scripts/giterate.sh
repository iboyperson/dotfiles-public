#!/bin/zsh


PROJECT_PATH="$(readlink -m $(dirname $0)/..)"
PUBLIC_PATH="$PROJECT_PATH/.public"

whitelist=()
blacklist=()

for role in "${(@f)"$(<$PUBLIC_PATH/whitelist)"}"
do
    whitelist_roles=("$role" $whitelist_roles)
    whitelist=("--include=/roles/$role" $whitelist)
done

for role in "${(@f)"$(<$PUBLIC_PATH/blacklist)"}"
do
    blacklist=("--exclude=/roles/$role" $blacklist)
done


# cd "$(dirname $0)/.."

# for commit in $(git rev-list $(cat $PUBLIC_PATH/last_public_hash)..HEAD)
# do
#     msg=$(git show --quiet --format=format:"%s" $commit)

#     # echo "${msg#*\:}"
#     # echo "${msg%:*}"

#     role_name="${msg%:*}"
#     if [[ ( ${whitelist_roles[(ie)$role_name]} -le ${#whitelist_roles} || $role_name == "all" ) && ${msg/$role_name} != $msg ]]; then
#         commit_history=($commit_history $msg)
#     fi

# done


# gen_changes() {
#     local changes="Changes:"

#     for commit in $(git rev-list $(cat $PUBLIC_PATH/last_public_hash)..HEAD)
#     do
#         local msg=$(git show --quiet --format=format:"%s" $commit)

#         local role_name="${msg%:*}"
#         if [[ ( ${whitelist_roles[(ie)$role_name]} -le ${#whitelist_roles} || $role_name == "all" ) && ${msg/$role_name} != $msg ]]; then
#             changes+="\n* $msg"
#         fi

#     done

#     echo "$changes"
# }

local changes="Changes:"

for commit in $(git rev-list $(cat $PUBLIC_PATH/last_public_hash)..HEAD)
do
    local msg=$(git show --quiet --format=format:"%s" $commit)

    local role_name="${msg%:*}"
    if [[ ( ${whitelist_roles[(ie)$role_name]} -le ${#whitelist_roles} || $role_name == "all" ) && ${msg/$role_name} != $msg ]]; then
        changes+="\n* $msg"
    fi
done

echo "Update public dotfiles\n\n$changes"

# echo $(gen_changes)

# CHANGES="Changes:"

# for commit in $commit_history
# do
#     CHANGES+="\n* $commit"
# done

# echo $CHANGES
# echo $commit_history
