# Architecture Notes

## Backend

The backend uses four layers:

- `controller`: HTTP endpoints only
- `application`: use-case orchestration
- `domain`: business model and repository interfaces
- `infrastructure`: MyBatis, persistence, configuration

Cross-cutting HTTP concerns are handled in `infrastructure.common`:

- `ApiResponse`: unified response body
- `GlobalExceptionHandler`: centralized exception mapping
- `ErrorCode`: shared business and platform error codes

Request flow:

```text
controller -> application -> domain -> infrastructure
```

## Frontend

The frontend uses:

- `pages`: page-level composition
- `components`: reusable UI parts
- `api`: backend access
