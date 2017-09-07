## Create New Event

### API Endpoint:
```
POST /v1/events
```

### Parameters
|           Name         |          Description           |   Required/Optional   |
|------------------------|--------------------------------|-----------------------|
|     event[name]        |          Name of Event         |     Optional
|     event[description] |       Description of Event     |     Optional   
|     event[location]    |        Location of Event       |     Optional     
|     event[start_date]  |Start Date of Event [yyyy-mm-dd]|     Optional     
|     event[end_date]    | End Date of Event [yyyy-mm-dd] |     Optional     



### Example Request

```shell
curl -X POST \
  http://localhost:3000/v1/events \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -H 'postman-token: 92a3e27f-0d0c-7e8a-2e4a-b24f2ae47009' \
  -F 'event[name]=Punjab Event' \
  -F 'event[description]=This is .......' \
```

### Response
```json
{
    "success": true,
    "message": "Event created successfully",
    "data": {
        "id": 29,
        "name": "Punjab Event",
        "description": "This is .......",
        "location": null,
        "start_date": null,
        "end_date": null,
        "duration": "",
        "status": "draft",
        "deleted": false,
        "created_at": "2017-09-07T11:55:04.000Z",
        "updated_at": "2017-09-07T11:55:04.000Z"
    }
}
```



## Update Specific Event

### API Endpoint:
```
PUT /v1/events/<event-id>
```

### Parameters
|           Name         |          Description           |   Required/Optional   |
|------------------------|--------------------------------|-----------------------|
|     event[name]        |          Name of Event         |     Required if status is published |
|     event[description] |       Description of Event     |     Required if status is published  | 
|     event[location]    |        Location of Event       |     Required if status is published   |
|     event[start_date]  |Start Date of Event [yyyy-mm-dd]|     Required if status is published    | 
|     event[end_date]    | End Date of Event [yyyy-mm-dd] |     Required if status is published |
|     event[status]      | Status draft or published      |     Optional |



### Example Request

```shell
curl -X PUT \
  http://localhost:3000/v1/events/1 \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -H 'postman-token: 92a3e27f-0d0c-7e8a-2e4a-b24f2ae47009' \
  -F 'event[name]=Punjab Event' \
  -F 'event[description]=This is .......' \
```

### Response
```json
{
    "success": true,
    "message": "Event updated successfully",
    "data": {
        "id": 29,
        "name": "Punjab Event",
        "description": "This is .......",
        "location": null,
        "start_date": null,
        "end_date": null,
        "duration": "",
        "status": "draft",
        "deleted": false,
        "created_at": "2017-09-07T11:55:04.000Z",
        "updated_at": "2017-09-07T11:55:04.000Z"
    }
}
```


## Get list of events

### API Endpoint:
```
GET /v1/events/
```

### GET Parameters
|           Name         |            Description             |   Required/Optional   |
|------------------------|------------------------------------|-----------------------|
|     page      | page number (default 1) |     optional|
| rpp  | Record per page (default 25) | optional |
    
### Example Request

```shell
curl -X GET \
  http://localhost:3000/v1/events/1/ \
 ```

### Response
```json
{
    "success": true,
    "events": [
        {
            "id": 1,
            "name": "My First Event",
            "description": "Woow",
            "location": "Chandigarh",
            "start_date": "2017-08-07",
            "end_date": "2017-08-08",
            "status": "published",
            "created_at": "2017-09-07T11:54:36.000Z",
            "updated_at": "2017-09-07T11:56:49.000Z"
        },
        {
            "id": 5,
            "name": "My Second Event woho",
            "description": "Woow",
            "location": "Chandigarh",
            "start_date": "2017-08-07",
            "end_date": "2017-08-08",
            "status": "published",
            "created_at": "2017-09-07T12:01:50.000Z",
            "updated_at": "2017-09-07T12:02:21.000Z"
        }
    ]
}
```


## Delete Specific Event

### API Endpoint:
```
DELETE /v1/events/<event-id>
```

### Example Request

```shell
curl -X DELETE \
  http://localhost:3000/v1/events/1 \
```

### Response
```json
{
    "success": true,
    "message": "Event deleted successfully",
    "data": {
        "id": 29,
        "name": "Punjab Event",
        "description": "This is .......",
        "location": null,
        "start_date": null,
        "end_date": null,
        "duration": "",
        "status": "published",
        "deleted": true,
        "created_at": "2017-09-07T11:55:04.000Z",
        "updated_at": "2017-09-07T11:55:04.000Z"
    }
}
```
