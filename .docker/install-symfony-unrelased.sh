#!/bin/sh
set -e # When this option is on returns an exit status value >0

rm -Rf tmp/
# https://symfony.com/doc/current/setup/unstable_versions.html
composer create-project symfony/skeleton tmp -s dev --prefer-dist --no-progress --no-interaction --no-install

cd tmp
cp -Rp . ..
cd -
rm -Rf tmp/

composer install --prefer-dist --no-progress --no-interaction