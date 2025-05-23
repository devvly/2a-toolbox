# cd to root directory
PROJECT_ROOT="$(cd "$(dirname "$0")/../../../../" && pwd)"
cd "$PROJECT_ROOT"

docker compose down
