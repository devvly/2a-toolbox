PROJECT_ROOT="$(cd "$(dirname "$0")/../../../../" && pwd)"
cd "$PROJECT_ROOT"

PROJECT_NAME="$(basename "$PROJECT_ROOT")"

if [ ! -f .env ]; then
    cp .env.example .env
fi

export $(grep -v '^#' .env | xargs)

docker compose up -d

docker exec -it ${PROJECT_NAME}-web php artisan migrate

docker exec -d ${PROJECT_NAME}-web php artisan queue:work --timeout=180
