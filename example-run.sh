#!/bin/bash

docker pull mbagliojr/zap2docker
docker run --rm -v $(pwd):/zap/wrk/:rw -t mbagliojr/zap2docker-weekly zap-baseline-custom.py -r report.html -g gen.conf -d -m 5 \
-t http://www.website.com \
--auth_loginurl "http://www.website.com/login" \
--auth_username exampleuser \
--auth_password p@ssw0rd \
--auth_usernamefield j_username \
--auth_passwordfield j_password \
--auth_submitfield submit \
--auth_exclude "http://www.website.com/j_spring_security_logout,http://www.website.com/j_spring_security_check.*" \
--active_scan
