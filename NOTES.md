## Objectives
Get comfortable with using form helpers, having models interact with each other, and building out a simple sessions system.
You're going to be building an amusement park. There will be *users*, *attractions*, and users can take *rides* on attractions.

## Instructions
Check out The Demo to see where this lab is headed.
This is a test driven lab, check out the model tests and get those to pass before moving onto the feature specs.
Remember, if you use scaffolds or generators do not overwrite the model specs that are included in this lab. Always use the --no-test-framework flag and enter n or no when prompted to overwrite the model specs for this lab.
A hint about requiring a password: ActiveRecord comes with a handy has_secure_password attribute that you can set on a model. It requires that you enable the bcrypt gem and that you add a password_digest column to your model.


Steps
1. create User, Attraction, Ride models
  1. Attraction is valid with a name, min_height, nausea_rating, happiness_rating, and ticket number
  2. Ride is valid with a user_id and a attraction_id
  3. User is valid with a name, password, happiness, nausea, height, and tickets

2. add password functionality
  1. add has_secure_password to user model
  2. add bcrypt gem to gemfile, bundle install
  3. add password_digest column to User table in migration

3. create a sessions controller

4. add routes to routes.rb
  1. root
  2. get /login
  3. post /login
  4. post /logout

5. views:
  1. root 'welcome#home'
  2. signup
  3. login
    - select username from dropdown list
    - enter your password
    - submit button 'Sign In'
  4. user/view

6. controller actions:
  2. sessions#new, sessions#create, sessions#destroy
  3. users#new, users#create, users#destroy
