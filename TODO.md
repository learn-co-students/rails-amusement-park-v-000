

* All generators should include `--no-test-framework` option
 - [x] Get the model passing first
  - [x] Create a DB
    - [x] User model
      - [x] name:string
      - [x] password:digest
      - [x] nausea:integer
      - [x] happiness:integer
      - [x] tickets:integer
      - [x] height:integer
      - [x] admin:boolean
    - [x] Attraction model
      - [x] name:string
      - [x] ticket:integer
      - [x] nausea_rating:integer
      - [x] happiness_rating:integer
      - [x] min_height:integer
    - [x] Ride mode (through model)
      - [x] user_id:integer
      - [x] attraction_id:integer
  - [x] require `bcrypt`
  - [x] use `has_secure_password` with model

  * Models
    - [x]add associations to models
    - [ ]add validation methods
      - [ ] example no empty fields for passwords or username
