# fullstack-demo

Monorepo project with:

- `frontend/`: Vite + React + JavaScript
- `backend/`: Spring Boot 2.2.0 + Maven + MyBatis + MySQL 8.0.28

## Required Versions

- JDK: `1.8`
- Maven: `3.6.3`
- Node.js: recommended `18+`

Backend follows a four-layer architecture:

- `controller`
- `application`
- `domain`
- `infrastructure`

## Structure

```text
.
├── backend
├── frontend
├── scripts
└── docs
```

## Run

## Quick Start

### Unified entry

```bash
./scripts/dev.sh init-db
./scripts/dev.sh start
./scripts/dev.sh restart
./scripts/dev.sh stop
./scripts/dev.sh status
./scripts/dev.sh logs
```

### Environment example

Copy values from `.env.example` into your shell environment as needed.
The default local scripts already assume:

```bash
SPRING_PROFILES_ACTIVE=local
DB_HOST=127.0.0.1
DB_PORT=3306
DB_NAME=cmb_demo
DB_USERNAME=root
DB_PASSWORD=
VITE_API_BASE_URL=http://127.0.0.1:8080
```

### Start database only

```bash
./scripts/init-db.sh
```

### Start backend only

```bash
./scripts/start-backend.sh
```

### Start frontend only

```bash
./scripts/start-frontend.sh
```

### Start everything

```bash
./scripts/start-all.sh
```

### Stop everything

```bash
./scripts/stop-all.sh
```

### Check status

```bash
./scripts/status.sh
```

### Backend

1. Create database and tables with `scripts/mysql/init.sql`
2. Update `backend/src/main/resources/application-dev.yml` if needed
3. Start backend:

```bash
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export PATH=/path/to/apache-maven-3.6.3/bin:$PATH
cd backend
mvn -s .mvn/settings.xml spring-boot:run
```

Backend default URL: `http://localhost:8080`

### Frontend

```bash
cd frontend
npm install
npm run dev
```

Frontend default URL: `http://localhost:5173`

## Demo API

- `GET /api/users`
