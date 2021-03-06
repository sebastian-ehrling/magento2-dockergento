#!/usr/bin/env bash
set -euo pipefail

${TASKS_DIR}/start_service_if_not_running.sh ${SERVICE_PHP}

${COMMANDS_DIR}/exec.sh sed -i -e 's/^\zend_extension/;zend_extension/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

${COMMANDS_DIR}/stop.sh
${COMMANDS_DIR}/start.sh

printf "> ${GREEN}xdebug disabled${COLOR_RESET}\n"