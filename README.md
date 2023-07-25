# EME - Excavation Made Easy

## Application specific infos:

* Ruby version - `3.0.0`

* Rails version - `7.0.6`

* PostgreSQL version - `13`

* How to run the test suite? - `bundle exec rspec`

* Deployed at - **https://eme.fly.dev/**

* Ticket creation endpoint - 
    * URL    - **https://eme.fly.dev/v1/tickets**
    * Action - **POST**
    * Params - JSON similar to the Sample JSON shared
    * Success Response - `{ "message": "Ticket created successfully", "status": "ok" }`
    * Failure Response - `{ "message": <Error message>, "status": "bad_request" }`
