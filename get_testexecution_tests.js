var axios = require('axios');
const { GraphQLClient, gql } = require('graphql-request')
const fs = require('fs');
var xray_cloud_base_url = "https://xray.cloud.getxray.app/api/v2";
var xray_cloud_graphql_url = xray_cloud_base_url + "/graphql";
var client_id = process.env.CLIENT_ID || "0213221E1B3C4347AA8234196172C30A";
var client_secret = process.env.CLIENT_SECRET || "9a9c03c9b5740e773f11ac12747defbea7323c75643d5adef3ed8557d3c4aadd";
var authenticate_url = xray_cloud_base_url + "/authenticate";

axios.post(authenticate_url, { "client_id": client_id, "client_secret": client_secret }, {}).then((response) => {
  console.log('success');
  var auth_token = response.data;
  console.log("AUTH: " + auth_token);
  const graphQLClient = new GraphQLClient(xray_cloud_graphql_url, {
    headers: {
      authorization: `Bearer ${auth_token}`,
    },
  })
  const detailed_query = gql`{
    getTestExecutions(jql:"project = QM",limit: 10) {
          total
          start
          limit
          results {
            issueId
            jira(fields: ["key"])
          }
    }
}
`
  graphQLClient.request(detailed_query).then(function (data) {
    console.log(JSON.stringify(data, undefined, 2));
    testexecution_key = String(data.getTestExecutions.results.at(0).jira.key);
  }).catch(function (error) {
    console.log('Error performing query: ' + error);
  });
}).catch((error) => {
  console.log('Error on Authentication: ' + error);
});


setTimeout(function(){
  axios.post(authenticate_url, { "client_id": client_id, "client_secret": client_secret }, {}).then((response) => {
    console.log('success');
    var auth_token = response.data;
    console.log("AUTH: " + auth_token);
    const graphQLClient = new GraphQLClient(xray_cloud_graphql_url, {
      headers: {
        authorization: `Bearer ${auth_token}`,
      },
    })
    const detailed_query = gql` {
      getTestExecutions(jql: "key=${testexecution_key}", limit: 1) {
        results{
                issueId
                jira(fields: ["key"])
                testRuns(limit: 100){
                  results{
                    id
                    status{
                      name
                      description
                    }
                    unstructured
                    test {
                        issueId
                        jira(fields: ["key"])
                          projectId
                    }
                  }
              }
          }
      }
  }   
  `
    graphQLClient.request(detailed_query).then(function (data) {
      console.log(JSON.stringify(data, undefined, 2));
      fs.writeFile('testExecution.json', JSON.stringify(data), (err) => {
        if (err) {
          throw err;
        }
        console.log("JSON data is saved.");
      });
    }).catch(function (error) {
      console.log('Error performing query: ' + error);
    });
  }).catch((error) => {
    console.log('Error on Authentication: ' + error);
  });
}, 5000);
