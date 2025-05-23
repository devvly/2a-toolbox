# cd to root directory
PROJECT_ROOT="$(cd "$(dirname "$0")/../../../../" && pwd)"
cd "$PROJECT_ROOT"

# Get project name from root folder
PROJECT_NAME="$(basename "$PROJECT_ROOT")"

# Create .env file if not exists
if [ ! -f .env ]; then
    cp .env.example .env
fi

# Export .env variables
export $(grep -v '^#' .env | xargs)

docker compose up -d

# Run laravel migrations
docker exec -it ${PROJECT_NAME}-web php artisan migrate

# Start queue worker in background
docker exec -d ${PROJECT_NAME}-web php artisan queue:work --timeout=180
