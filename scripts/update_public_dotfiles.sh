#! /bin/zsh

PROJECT_PATH="$(readlink -m $(dirname $0)/..)"
CACHE_PATH="$PROJECT_PATH/.cache"
REPO_PATH="$CACHE_PATH/dotfiles-public"
MIRROR_PATH="$CACHE_PATH/mirror"
MIRROR_PUBLIC_PATH="$MIRROR_PATH/.public"
PROJECT_PUBLIC_PATH="$PROJECT_PATH/.public"

echo "==> Pulling latest changes from 'dotfiles-public' or cloning if it does not exist..."
if [[ -d $REPO_PATH ]]; then
    git -C $REPO_PATH pull -q
else
    git -C $CACHE_PATH clone -q https://github.com/iboyperson/dotfiles-public.git
fi

echo "==> Pulling latest changes into mirror repo or creating mirror if it does not exist..."
if [[ ! -d $MIRROR_PATH ]]; then
    mkdir -p $MIRROR_PATH
    git -C $MIRROR_PATH init -q
    git -C $MIRROR_PATH remote add mirror "$PROJECT_PATH" -q
fi

git -C $MIRROR_PATH pull mirror master -q

echo "==> Syncronizing files..."
# TODO: Sanitize deadbeef so it can be unexcluded
# `--exclude` uses `/` because `/` refers to the top level of the source and not root

for role in "${(@f)"$(<$MIRROR_PUBLIC_PATH/whitelist)"}"
do
    whitelist_roles=("$role" $whitelist_roles)
    whitelist=("--include=/roles/$role" $whitelist)
done

for role in "${(@f)"$(<$MIRROR_PUBLIC_PATH/blacklist)"}"
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
    "$MIRROR_PATH/" "$REPO_PATH"

rsync -a "$MIRROR_PUBLIC_PATH/README.md" "$REPO_PATH"


echo "==> Updating files in git..."
# Generate a changelog
local changes=""
local hash_updated=false

whitelist_roles+=("all" "public" "general")

for commit in $(git -C $MIRROR_PATH rev-list $(cat $PROJECT_PUBLIC_PATH/last_public_hash)..HEAD)
do
    if [[ ! $hash_updated == true ]]; then
        hash_updated=true

        # Update 'last_public_hash' to latest commit
        echo $commit > $PROJECT_PUBLIC_PATH/last_public_hash
    fi

    local msg=$(git -C $MIRROR_PATH show --quiet --format=format:"%s" $commit)

    local role_name="${msg%:*}"
    if [[ ( ${whitelist_roles[(ie)$role_name]} -le ${#whitelist_roles}) && ${msg/$role_name} != $msg ]]; then
        changes+="\n* $msg"
    fi
done

echo $changes

# Only commit files if there are documented changes
if [[ ! -z $changes ]]; then
    # Stage and commit files
    git -C $REPO_PATH add .
    git -C $REPO_PATH commit -qm "Update public dotfiles" -m "$(echo Changes:$changes)"
fi

# Push files to remote repo
git -C $REPO_PATH push -q





