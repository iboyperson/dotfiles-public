#! /bin/zsh

PROJECT_PATH="$(readlink -m $(dirname $0)/..)"
CACHE_PATH="$PROJECT_PATH/.cache"
REPO_PATH="$CACHE_PATH/dotfiles-public"
PUBLIC_PATH="$PROJECT_PATH/.public"


echo "==> Pulling latest changes or cloning if it does not exist..."
if [[ -d $REPO_PATH ]]; then
    git -C $REPO_PATH pull -q
else
    git -C $CACHE_PATH clone -q https://github.com/iboyperson/dotfiles-public.git
fi


echo "==> Syncronizing files..."
# TODO: Sanitize deadbeef so it can be unexcluded
# `--exclude` uses `/` because `/` refers to the top level of the source and not root

for role in "${(@f)"$(<$PUBLIC_PATH/whitelist)"}"
do
    whitelist_roles=("$role" $whitelist_roles)
    whitelist=("--include=/roles/$role" $whitelist)
done

for role in "${(@f)"$(<$PUBLIC_PATH/blacklist)"}"
do
    blacklist=("--exclude=/roles/$role" $blacklist)
done

rsync -a \
    --delete \
    --filter="dir-merge,- .gitignore" \
    --exclude ".git" \
    --exclude ".public" \
    --exclude "/README.md" \
    --exclude "/group_vars/local/vault.yml" \
    "${blacklist[@]}" \
    "${whitelist[@]}" \
    --exclude "/roles/*" \
    "$PROJECT_PATH/" "$REPO_PATH"

rsync -a "$PUBLIC_PATH/README.md" "$REPO_PATH"


echo "==> Updating files in git..."
# Only commit if there are changes
if output=$(git -C $REPO_PATH status --porcelain) && [ ! -z "$output" ]; then

    # Generate a changelog
    local changes="Changes:"
    local hash_updated=false

    for commit in $(git -C $PROJECT_PATH rev-list $(cat $PUBLIC_PATH/last_public_hash)..HEAD)
    do
        if [[ ! $hash_updated == true ]]; then
            hash_updated=true
            echo "SD"
            echo $commit > $PUBLIC_PATH/last_public_hash
        fi

        local msg=$(git -C $PROJECT_PATH show --quiet --format=format:"%s" $commit)

        local role_name="${msg%:*}"
        if [[ ( ${whitelist_roles[(ie)$role_name]} -le ${#whitelist_roles} || $role_name == "all" ) && ${msg/$role_name} != $msg ]]; then
            changes+="\n* $msg"
        fi
    done

    # Stage and commit files
    git -C $REPO_PATH add .
    git -C $REPO_PATH commit -qm "Update public dotfiles" -m "$(echo $changes)"

    # Push files to remote repo
    # git -C $REPO_PATH push -q
fi




