PROJECT_NAME="$(basename "$(pwd)")"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)/../docker"

USE_MAIL=false
USE_TESTS=false

# Разбор аргументов
for arg in "$@"; do
    case $arg in
        --mail)
            USE_MAIL=true
            ;;
        --tests)
            USE_TESTS=true
            ;;
    esac
done

# Выбор шаблона
if $USE_MAIL; then
    TEMPLATE="$SOURCE_DIR/docker-compose-dist-mailpit.yml"
else
    TEMPLATE="$SOURCE_DIR/docker-compose-dist.yml"
fi

# Генерация docker-compose.yml
sed "s/\${PROJECT_NAME}/$PROJECT_NAME/g" "$TEMPLATE" > "$(pwd)/docker-compose.yml"

# Генерация docker-compose-tests.yml если нужно
if $USE_TESTS; then
    sed "s/\${PROJECT_NAME}/$PROJECT_NAME/g" "$SOURCE_DIR/docker-compose-tests-dist.yml" > "$(pwd)/docker-compose-tests.yml"
fi

echo "✅ Created docker-compose file(s) with project name: $PROJECT_NAME"
