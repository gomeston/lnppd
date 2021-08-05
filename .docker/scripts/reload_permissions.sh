#!/bin/bash

WORK_DIR=/var/www/
LOGIN=www-data
GROUP=www-data

find \
    $WORK_DIR/vendor \
    -type f -exec chmod g+w {} +

find \
    $WORK_DIR/vendor \
    -type d -exec chmod g+ws {} +

chown -R $LOGIN:$GROUP $WORK_DIR

