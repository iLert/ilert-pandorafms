#!/bin/bash

res_code=$(curl -o /dev/null -s -w "%{http_code}\n" -X POST "https://api.ilert.dev/api/v1/events/pandorafms/${1}" -H "Content-Type: application/json" -d '{
     "eventType": "'"${2}"'",
     "title": "'"${4}"'",
     "description": "'"${5}"'",
     "incidentKey": "'"${3}"'",
     "details": {
          "agentName": "'"${8}"'",
          "createdAt": "'"${6}"'",
          "priority": "'"${7}"'",
          "moduleName": "'"${9}"'",
          "moduleData": "'"${10}"'"
     }
   }')

if [[ $res_code = "200" ]]
then
  echo "Alert has been submitted!";
else
  echo "HTTP POST ERROR: $res_code";
fi
