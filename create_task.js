var myJson = require('./testExecution.json')
var keys = [];
var status = [];
var obj = {};
const fetch = require('node-fetch')

myJson.getTestExecutions.results.at(0).testRuns.results.forEach(element => {
    if (element.status.name == "FAILED") {
        keys.push(element.test.jira.key);
        status.push(element.unstructured);
    }
});

for (var i = 0; i < keys.length; i++) {
    obj[keys[i]] = status[i];
}

for (var key of Object.keys(obj)) {
  console.log(key + " => " + obj[key] + "</br>")
  const bodyData = JSON.stringify(
    {
      fields: {
        "summary": "Error en prueba automatica  " + obj[key],
        "issuetype": {
          "name": "Bug"
        },
        "project": {
          "key": "QM"
        },
        "description": {
          "type": "doc",
          "version": 1,
          "content": [
            {
              "type": "paragraph",
              "content": [
                {
                  "text": "Demo",
                  "type": "text"
                }
              ]
            }
          ]
        },
        "reporter": {
            "accountId": "557058:f4bb59f5-8091-4f11-a936-b31a86e91a1a"
        },
        "customfield_10501": {
          "value": "INTERNO (AOI)"
        },
        "customfield_11200": {
          "value": "INTERNO - Estructura TIMS [2021-15425]"
        },
        "customfield_12961": {
          "type": "doc",
          "version": 1,
          "content": [
            {
              "type": "paragraph",
              "content": [
                {
                  "text": "Demo issue fallida",
                  "type": "text"
                }
              ]
            }
          ]
        },
        "customfield_12962":{
          "type": "doc",
          "version": 1,
          "content": [
            {
              "type": "paragraph",
              "content": [
                {
                  "text": "Demo issue fallida",
                  "type": "text"
                }
              ]
            }
          ]
        }
      }
    });

  fetch('https://hiberustravel.atlassian.net/rest/api/3/issue', {
    method: 'POST',
    headers: {
        'Authorization': `Basic ${Buffer.from('jvillen@hiberus.com:mkkluihWRmtg8au1JCyY8193').toString('base64')}`,
        'Accept': 'application/json',
        'Content-Type': 'application/json'
    },
    body: bodyData
  }).then(response => {
        console.log(
            `Response: ${response.status} ${response.statusText}`
        );
        return response.text();
    }).then(text => console.log(text)).catch(err => console.error(err));
}
