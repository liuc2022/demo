# Repository Guidelines

## Project Structure & Module Organization

This repository is a small full-stack monorepo.

- `frontend/`: Vite + React + JavaScript UI. Main app code lives under `frontend/src/`.
- `backend/`: Spring Boot 2.2.0 + MyBatis service. Java sources live under `backend/src/main/java/cmb/cmbchina/demo/`.
- `backend/src/test/`: backend tests.
- `scripts/`: local developer entrypoints such as `dev.sh`, `start-all.sh`, and `status.sh`.
- `docs/`: lightweight architecture notes.
- `openspec/`: OpenSpec workspace metadata.

Backend follows the four-layer structure: `controller`, `application`, `domain`, and `infrastructure`.

## Agent Skill Workflow

Use skills by task type instead of applying every available skill.

- Start with `using-superpowers` or `superpowers` for non-trivial work: clarify the outcome, inspect the repo, make a short plan, implement in small verified steps, and finish with review notes.
- Use `grill-with-docs` when requirements are unclear, architectural choices are contested, or a decision should become durable documentation. Use it to sharpen the plan before implementation.
- Use `brainstorming` for new features or behavior changes, then `writing-plans` when the change spans multiple steps or modules.
- Use `test-driven-development` for feature and bugfix implementation when behavior can be captured by tests before code.
- Use `systematic-debugging` for bugs, failing tests, startup failures, or unexpected runtime behavior. Reproduce and isolate the cause before changing code.
- Use `verification-before-completion` before claiming work is done. Prefer `mvn -s .mvn/settings.xml test` for backend changes and `npm run build` for frontend changes.
- Use `requesting-code-review` after substantial implementation. Use `receiving-code-review` before applying review feedback that changes behavior or architecture.
- Use GitNexus skills selectively: `gitnexus-exploring` for code flow discovery, `gitnexus-impact-analysis` before risky edits, `gitnexus-refactoring` for safe structural changes, and `gitnexus-taint-analysis` for source-to-sink or security data-flow questions.
- Use `ui-styling`, `design-system`, and `control-in-app-browser` for frontend UI changes and browser verification.
- Use `openspec` only for spec-driven changes or work that modifies `openspec/`.

## Build, Test, and Development Commands

Use the wrapper scripts at the repo root where possible:

- `./scripts/dev.sh start`: start MySQL, backend, and frontend.
- `./scripts/dev.sh stop`: stop all local services.
- `./scripts/dev.sh status`: check process and port health.
- `./scripts/dev.sh logs backend`: tail backend logs.
- `./scripts/init-db.sh`: initialize the local MySQL schema.

Direct module commands:

- `cd frontend && npm run dev`
- `cd frontend && npm run build`
- `cd backend && mvn -s .mvn/settings.xml test`
- `cd backend && mvn -s .mvn/settings.xml spring-boot:run`

## Coding Style & Naming Conventions

- Use 4 spaces for Java, 2 spaces for JS/JSON/CSS.
- Keep Java packages under `cmb.cmbchina.demo`.
- Use `UpperCamelCase` for Java classes, `lowerCamelCase` for methods and fields.
- React components use `UpperCamelCase` file names such as `UserPage.jsx`.
- Keep controller methods thin; business flow belongs in `application`, persistence in `infrastructure`.

## Testing Guidelines

- Backend tests use Spring Boot Test and JUnit 5.
- Add controller or application-layer tests under `backend/src/test/java/...`.
- Name test classes `*Test.java`.
- Run backend tests with `mvn -s .mvn/settings.xml test`.
- Frontend currently has no test runner configured; add tests only with an agreed toolchain.

## Commit & Pull Request Guidelines

- Current history uses short imperative commits, for example: `Initial commit`.
- Prefer concise subjects such as `Add user creation flow` or `Fix MySQL local config`.
- PRs should include: purpose, main changes, local verification steps, and screenshots for UI updates.

## Security & Configuration Tips

- Do not commit local secrets or machine-specific overrides.
- Use `.env.example` as the reference for local environment variables.
- Keep `.m2/`, `.tmp/`, `.logs/`, `frontend/node_modules/`, and `backend/target/` out of version control.

## 项目规则

- 修改代码后，先运行项目已有测试或构建。
- 不要修改与当前任务无关的文件。
- 新增依赖前，先说明原因并等待确认。
- 如果检查失败，请区分是本次改动导致，还是原本就存在。
