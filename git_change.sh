# git filter-branch --commit-filter '
#         if [ "$GIT_COMMITTER_NAME" = "xiaowuc2" ];
#         then
#                 GIT_COMMITTER_NAME="webdevych";
#                 GIT_AUTHOR_NAME="webdevych";
#                 GIT_COMMITTER_EMAIL="lee.darren1218@gmail.com";
#                 GIT_AUTHOR_EMAIL="lee.darren1218@gmail.com";
#                 git commit-tree "$@";
#         else
#                 git commit-tree "$@";
#         fi' HEAD


git filter-branch --env-filter '
OLD_EMAIL="62144916+Gayathry17@users.noreply.github.com"
CORRECT_NAME="webdevych"
CORRECT_EMAIL="lee.darren1218@gmail.com"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags