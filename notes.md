Attraction
   name
   min_height
   nausea_rating
   happiness_rating
   ticket number

   associations:
     has many :rides
     has many :users, through :rides

Ride
  user_id
  attraction_id

  associations:
    belongs_to :attraction
    belongs_to :user

  methods:
    #take_ride

User
  name
  password
  happiness
  nausea
  height
  tickets

  validations:
      has_secure_password
      is valid with an admin boolean
      defaults to admin => false

  associations:
      has many :rides
      has many :attractions, through: :rides

  methods:
    #mood

-----------------------------------------

rails g model Attraction name:string min_height:integer nausea_rating:integer happiness_rating:integer ticket_number:integer --no-test-framework
------
rails g model Ride user_id:integer attraction_id:integer --no-test-framework
------
rails g model User name:string password:string happiness:integer nausea:integer height:integer tickets:integer --no-test-framework


Hi! I am currently working on the following lab: Rails Amusement Park.

I am working on the take_ride method. Specifically,
-  user not having enough tickets
-  user not being tall
 enough
- not having enough tickets

update(user):
-  nausea
- happiness

update(ride):
- ticket_number
