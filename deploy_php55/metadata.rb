name        "deploy_php55"
description "Deploy PHP 5.5 Application"
maintainer  "Yoshiwaan"
license     "Apache 2.0"
version     "1.0.0"

depends "deploy"
depends "apache24"
depends "mod_php55_apache24"

recipe "deploy_php55::php", "Deploy a PHP 5.5 application"
