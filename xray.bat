curl -H "Content-Type: application/json" -X POST --data @"cloud_auth.json" "https://xray.cloud.getxray.app/api/v2/authenticate" > token.txt
set /p VV=<token.txt
curl -H "Content-Type: text/xml" -X POST -H "Authorization: Bearer %VV%" --data @"test-results.xml" https://xray.cloud.getxray.app/api/v2/import/execution/junit?projectKey=PRB
