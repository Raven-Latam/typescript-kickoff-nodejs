# Docker Setup for TypeScript Kickoff

This project now includes complete Docker configuration to facilitate development and deployment.

## Docker files created

- `Dockerfile` - Configuration to build the application image
- `docker-compose.yml` - Service orchestration (app + PostgreSQL)
- `.dockerignore` - Files to exclude from Docker context
- `env.example` - Environment variables example

## Available commands

### npm scripts for Docker

```bash
# Build Docker image
npm run docker:build

# Run container
npm run docker:run

# Start all services (app + PostgreSQL)
npm run docker:up

# Stop all services
npm run docker:down

# View logs in real time
npm run docker:logs

# Development mode (with visible logs)
npm run docker:dev
```

### Direct Docker Compose commands

```bash
# Start services in background
docker-compose up -d

# Start services with visible logs
docker-compose up

# Stop services
docker-compose down

# View logs
docker-compose logs -f

# Rebuild and start
docker-compose up --build

# Stop and remove volumes
docker-compose down -v
```

## Configuration

### Environment variables

Copy the `env.example` file to `.env` and adjust variables as needed:

```bash
cp env.example .env
```

### Ports

- **Application**: http://localhost:3000
- **PostgreSQL**: localhost:5432

### Database

Default configuration includes:
- Host: `postgres` (service name in Docker)
- Port: `5432`
- Username: `username`
- Password: `password`
- Database: `mydb`

## Development

### Option 1: Only database in Docker

```bash
# Start only PostgreSQL
docker-compose up postgres -d

# Run app locally
npm run dev
```

### Option 2: Everything in Docker with hot reload

```bash
# Start entire stack with hot reload
npm run docker:dev

# Rebuild and start (if you change dependencies)
npm run docker:dev:build

# Restart just the app container
npm run docker:dev:restart

# Stop development environment
npm run docker:dev:down
```

### Automatic Schema Updates

When you modify your TypeORM entities (add/remove columns), the database schema will automatically update because:

- `synchronize: true` is enabled in development
- The app restarts automatically when you change files (hot reload)
- TypeORM detects entity changes and updates the database schema

**Example workflow:**
1. Modify `src/entities/User.ts` (add/remove columns)
2. Save the file
3. The app automatically restarts
4. TypeORM updates the database schema
5. Your changes are immediately available

## Production

For production, consider:

1. Change `NODE_ENV=production` in environment variables
2. Use persistent volume for PostgreSQL
3. Configure SSL/TLS
4. Implement health checks
5. Use a reverse proxy (nginx)

## Troubleshooting

### Clean everything

```bash
# Stop and remove containers, networks and volumes
docker-compose down -v

# Remove images
docker rmi typescript-kickoff
```

### Check container status

```bash
docker-compose ps
```

### Access container

```bash
# Access app container
docker-compose exec app sh

# Access PostgreSQL
docker-compose exec postgres psql -U username -d mydb
```
