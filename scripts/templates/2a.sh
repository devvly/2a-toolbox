TOOLBOX_PATH="vendor/devvly/2a-toolbox/scripts"
COMMAND="$1"
shift

SCRIPT="$TOOLBOX_PATH/${COMMAND}.sh"

if [ -f "$SCRIPT" ]; then
    bash "$SCRIPT" "$@"
else
    echo "Unknown 2a command: $COMMAND"
    echo "Available commands:"
    ls "$TOOLBOX_PATH" | grep '\.sh$' | sed 's/\.sh$//' | xargs -n1 echo " -"
    exit 1
fi
