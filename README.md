# PHP OCI8 Docker

PHP Docker containers with Oracle Instant Client and OCI8 extension for Oracle Database connectivity.

## Supported PHP Versions

- PHP 7.4
- PHP 8.0
- PHP 8.1
- PHP 8.2

## Features

- Oracle Instant Client 23.7
- OCI8 extension pre-installed
- Composer included
- Git included
- Multi-architecture support (arm64/x64)

## Included PHP Extensions

| Extension | Description |
|-----------|-------------|
| oci8 | Oracle Database connectivity |
| pdo | PHP Data Objects |
| pdo_mysql | MySQL driver for PDO |
| pdo_pgsql | PostgreSQL driver for PDO |
| pdo_sqlite | SQLite driver for PDO |
| mbstring | Multibyte string handling |
| zip | Archive handling |
| gd | Image processing |
| bcmath | Arbitrary precision mathematics |
| intl | Internationalization |
| opcache | Opcode caching for performance |

## Quick Start

### Build Images

```bash
docker compose build
```

### Run PHP

```bash
docker compose run --rm php82 php -v
docker compose run --rm php82 php your-script.php
```

### Run Composer

```bash
docker compose run --rm -v $(pwd):/app php82 composer install
```

## Shell Aliases (Optional)

Add to `~/.zshrc` or `~/.bashrc`:

```bash
# PHP with OCI8
alias php74="docker compose -f ~/Projects/docker-services/php-oci8/docker-compose.yml run --rm -v \$(pwd):/app php74 php"
alias php80="docker compose -f ~/Projects/docker-services/php-oci8/docker-compose.yml run --rm -v \$(pwd):/app php80 php"
alias php81="docker compose -f ~/Projects/docker-services/php-oci8/docker-compose.yml run --rm -v \$(pwd):/app php81 php"
alias php82="docker compose -f ~/Projects/docker-services/php-oci8/docker-compose.yml run --rm -v \$(pwd):/app php82 php"

# Composer with OCI8
alias composer74="docker compose -f ~/Projects/docker-services/php-oci8/docker-compose.yml run --rm -v \$(pwd):/app php74 composer"
alias composer80="docker compose -f ~/Projects/docker-services/php-oci8/docker-compose.yml run --rm -v \$(pwd):/app php80 composer"
alias composer81="docker compose -f ~/Projects/docker-services/php-oci8/docker-compose.yml run --rm -v \$(pwd):/app php81 composer"
alias composer82="docker compose -f ~/Projects/docker-services/php-oci8/docker-compose.yml run --rm -v \$(pwd):/app php82 composer"
```

Then reload: `source ~/.zshrc`

## Usage Examples

```bash
# Check PHP version
php82 -v

# Check OCI8 extension
php82 -m | grep oci8

# Run a script
php82 script.php

# Install dependencies
composer82 install

# Add a package
composer82 require vendor/package
```

## Verify OCI8

```bash
docker compose run --rm php82 php -m | grep oci8
```

## Author

Andrio Pratama Sirait

## License

MIT
