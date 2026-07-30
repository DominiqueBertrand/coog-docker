# Identités API

JWT=$(python3 -c "                                                                                   
import jwt, time                       
print(jwt.encode(                  
    {'identity': 'admin-gateway', 'context': {}, 'exp': int(time.time()) + 3600},
    'changemeinproduction',                                                                                                                                                            
    algorithm='HS256'
))
")


url -i -X POST http://coog-timesheet.localhost/tryphene/coog-timesheet/admin \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $JWT" \
  -d '{
    "query": "mutation { AuthenticateWithCredentials(params: {login: \"marie.dupont@aesio.com\", password: \"admin\"}) { identity { uuid } } }"
  }'

  curl -i -X POST http://coog-timesheet.localhost/tryphene/coog-timesheet/admin \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $JWT" \
  -d '{
    "query": "mutation { AuthenticateWithCredentials(params: {login: \"marie.dupont@aesio.com\", password: \"coopengo\"}) { identity { uuid } } }"
  }'


  curl -i -X POST http://coog-timesheet.localhost/tryphene/coog-timesheet/admin \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $JWT" \
  -d '{
    "query": "mutation { AuthenticateWithApiKey(params: {apiKey: "%s"}) { identity { uuid } } }"
  }'

## Admin

- identifiant:`coog_api_admin`
- Clé API:`73a2ae716d1ef2b2343281da5e53c176bea612d8c36236f2`
- Utilisateur:`API Gateway`

## User

- identifiant:`dominique.bertrand@gmail.com`
  - Mot de passe:`coog`
  - Utilisateur:`API Gateway`
  - Tiers: [1016] BERTRAND Dominique
- identifiant:`marie.dupont@aesio.com`
  - Mot de passe:`coopengo`
  - Utilisateur:`aesio`
  - Tiers: [22] Marie Dupont

## GraphiQL

| available in developement mode

- DEPRECATED <http://localhost:3001/gateway/portal/graphql>
- <http://localhost:3001/saas/portal/graphql>
- <http://localhost:3001/saas/customer/graphql>



### Rerady to run  snipet to run GrphQL query (bypassing gateway)

```bash
JWT=$(node -e "
const jwt = require('jsonwebtoken');
const token = jwt.sign(
  { identity: '8a8667f7-4c4f-4823-b612-2b7540a4396f', context: {} },
  'changemeinproduction',
  { algorithm: 'HS256', expiresIn: '1h' }
);
console.log(token);
")

curl -s -X POST http://coog-timesheet.localhost/tryphene/coog-timesheet/customer-portal \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $JWT" \
  --data-raw '{"query":"query fetchIssues {\n  issues {\n    edges {\n      node {\n        project {\n          key\n        }\n        summary\n        comments {\n          body\n          author {\n            name\n          }\n        }\n        description\n        status {\n          isClosed\n          name\n        }\n      }\n    }\n    pageInfo {\n      hasNextPage\n      hasPreviousPage\n      startCursor\n      endCursor\n    }\n    totalCount\n  }\n  version\n}\n","operationName":"fetchIssues"}'

{"data":{"issues":{"edges":[],"pageInfo":{"hasNextPage":false,"hasPreviousPage":false,"startCursor":null,"endCursor":null},"totalCount":0},"version":"26.27.2627"}}%  
```
