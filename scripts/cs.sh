PROJECT_ROOT="$(cd "$(dirname "$0")/../../../../" && pwd)"
PROJECT_NAME="$(basename "$PROJECT_ROOT")"

PINT_CONFIG="/var/www/html/vendor/devvly/2a-toolbox/pint.json"

docker exec -it "${PROJECT_NAME}-web" ./vendor/bin/pint --config="$PINT_CONFIG" "$@"
