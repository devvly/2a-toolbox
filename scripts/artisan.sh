# cd to root directory
PROJECT_ROOT="$(cd "$(dirname "$0")/../../../../" && pwd)"
cd "$PROJECT_ROOT"

# Get project name from root folder
PROJECT_NAME="$(basename "$PROJECT_ROOT")"

# Run artisan command inside the web container
docker exec -it ${PROJECT_NAME}-web php artisan "$@"
