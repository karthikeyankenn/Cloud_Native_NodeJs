## CURL commands to perform CRUD operations

1. POST
```sh
    curl -X POST -H "Content-Type: application/json" -d '{"title": "Keep calm and test", "contact": "Average Tester"}' http://localhost:3000/api/v1/ads
```

2. GET ALL ads
```sh
    curl http://localhost:3000/api/v1/ads
```

3. GET ad (use the correct id based on the POST response)
```sh
    curl http://localhost:3000/api/v1/ads/1
```

4. PUT ad (use the correct id based on the POST response)
```sh
    curl -X PUT -H "Content-Type: application/json" -d '{"title": "Updated Title", "contact": "Updated Contact"}' http://localhost:3000/api/v1/ads/1
```

5. DELETE ad (use the correct id based on the POST response)
```sh
    curl -X DELETE http://localhost:3000/api/v1/ads/1
```
