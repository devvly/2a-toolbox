PROJECT_ROOT="$(cd "$(dirname "$0")/../../../../" && pwd)"
cd "$PROJECT_ROOT"

PROJECT_NAME="$(basename "$PROJECT_ROOT")"

docker compose --file docker-compose-tests.yml up -d

until docker exec ${PROJECT_NAME}-mysql-test mysqladmin ping -h "127.0.0.1" --silent; do
  echo -n "."; sleep 1;
done

if [ -n "$1" ]; then
    docker exec -it ${PROJECT_NAME}-web-test php artisan test tests/Feature/"$1"
else
    docker exec -it ${PROJECT_NAME}-web-test php artisan test
fi

docker compose --file docker-compose-tests.yml down -v
