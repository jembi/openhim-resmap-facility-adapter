#!/bin/bash
# This must be set to the path in which your soap ui instance is installed
SOAPUI_TESTRUNNER="/home/jembi/SmartBear/soapUI-4.5.2/bin/testrunner.sh"

# Launch standalone wiremock for mocked services
java -jar wiremock-1.33-standalone.jar --verbose &
WireMockPID=$!
sleep 2s

# Launch soap ui integration testing suite
$SOAPUI_TESTRUNNER -ehttp://localhost:8082 -utest -ptest -r -f. -I facility-adapter-integration-tests.xml

# Kill wiremock dead
kill -HUP $WireMockPID
