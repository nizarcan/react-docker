.PHONY: build

build_docker:
	@echo "Stopping existing container..."
	docker-compose down
	@echo "Building and running new container..."
	docker-compose up --build -d

build_local:
	@echo "Building the project locally..."
	npm run build

start:
	@echo "Starting development server..."
	npm start

test:
	@echo "Running tests..."
	npm test