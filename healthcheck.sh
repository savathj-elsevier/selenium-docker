#!/usr/bin/env bash
# Environment Variables
# HUB_HOST
# BROWSER
# MODULE

echo "Checking if hub is ready - $HUB_HOST"

while [ "$( curl -s http://172.17.0.3:4445/wd/hub/status | jq -r .value.ready )" != "true" ]
do
	sleep 1
done

# start the java command
java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* \
    #-DHUB_HOST=$HUB_HOST \
    #-DBROWSER=$BROWSER \
    #-Dcucumber.options="classpath:features" \
    org.testng.TestNG -testclass com.runner.TestRunner