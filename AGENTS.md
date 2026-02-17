# AGENTS.md - PHP OCI8 Docker

## Project Overview
PHP Docker container with Oracle Instant Client and OCI8 extension for Oracle Database connectivity support multi version of PHP (7.4, 8.0, 8.1, 8.2).

## Build Commands
- `docker compose build` - Build the Docker image
- `docker compose up -d` - Start the container
- `docker compose down` - Stop the container
- `docker compose exec php php -m | grep oci8` - Verify OCI8 extension is loaded
- `docker compose exec php php -v` - Check PHP version

## Code Style Guidelines
- Use official PHP Docker images as base (e.g., `php:8.2-fpm` or `php:8.2-cli`)
- Install Oracle Instant Client from official Oracle repositories
- Use multi-stage builds when possible to reduce image size
- Keep Dockerfile instructions ordered: FROM, ENV, RUN (deps), COPY, CMD
- Use `.dockerignore` to exclude unnecessary files

## Error Handling
- Always verify OCI8 extension loads with `php -m | grep oci8`
- Test Oracle connectivity with a simple PHP script using `oci_connect()`

## Key Dependencies
- Oracle Instant Client (Basic + SDK)
- PHP OCI8 extension (via PECL or compile)
- libaio, libnsl (required Linux libraries)
