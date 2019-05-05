<!-- creating a model is not the same as creating a table, they're not synonymous. the model talks to the table. you still have to migrate  -->

<!-- consider looking more at patterns as opposed to remembering stuff like memorizing syntax for example  -->

<!--
this is more about sessions

user signs in and submits the form > goes to sessions controller >
they will logged in if their info is valid > redirect somewhere

-as a programmer and engineer, it's not about learning syntax. but rather if you see a method like collection_select, how can we make it work for you. it's creativity  -->

Jad Abdallah AN HOUR AGO
Failures:

  1) Feature Test: User Signup successfully logs in as non-admin
     Failure/Error: fill_in("password", :with => "password")

     Capybara::ElementNotFound:
       Unable to find visible field "password" that is not disabled
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/node/actions.rb:92:in `fill_in'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/support/login_helper.rb:16:in `user_login'
     # ./spec/features/users_features_spec.rb:30:in `block (2 levels) in <top (required)>'

Finished in 0.47354 seconds (files took 2.13 seconds to load)
3 examples, 1 failure

Failed examples:

rspec ./spec/features/users_features_spec.rb:24 # Feature Test: User Signup successfully logs in as non-admin
User avatar
User avatar
Abdoul Diallo AN HOUR AGO
Hey jad!
Jad Abdallah AN HOUR AGO
it's visible in the browser
User avatar
User avatar
Abdoul Diallo AN HOUR AGO
How are you?
Jad Abdallah AN HOUR AGO
the password field i mean
User avatar
Jad Abdallah AN HOUR AGO
hey i'm good how are yo
User avatar
Jad Abdallah AN HOUR AGO
you
User avatar
User avatar
Abdoul Diallo AN HOUR AGO
Are you available for a screenshare?
Jad Abdallah AN HOUR AGO
sure
User avatar
User avatar
Abdoul Diallo AN HOUR AGO
I'm good thanks :smile:
User avatar
Abdoul Diallo AN HOUR AGO
Someone will be with you shortly
Jad Abdallah AN HOUR AGO
ok great
User avatar
User avatar
Matthew Dizon AN HOUR AGO
Hey Jad can you run learn save for me
Jad Abdallah AN HOUR AGO
sure
User avatar
Jad Abdallah AN HOUR AGO
ok done
User avatar
User avatar
Matthew Dizon 44 MINUTES AGO
so it seems this is a capybara issue
User avatar
Matthew Dizon 44 MINUTES AGO
Unable to find visible field "password" that is not disabled
User avatar
Matthew Dizon 44 MINUTES AGO
I see you have a textfield but it really wants a passowrd field here
Jad Abdallah 43 MINUTES AGO
oh is that a separate kind of field? i thought it just meant a text field for the password
User avatar
Jad Abdallah 43 MINUTES AGO
ill try it
User avatar
Jad Abdallah 39 MINUTES AGO
hmm it's the same error
User avatar
User avatar
Matthew Dizon 39 MINUTES AGO
can you run learn save again
Jad Abdallah 37 MINUTES AGO
sure it's done
User avatar
User avatar
Matthew Dizon 37 MINUTES AGO
it seems you didnt change the view in your new user view
Jad Abdallah 36 MINUTES AGO
ok but isn't this error about the signin feature instead of the new user one?
User avatar
User avatar
Matthew Dizon 36 MINUTES AGO
yea
Jad Abdallah 36 MINUTES AGO
or does it have to go down the whole chain to reach this point
User avatar
User avatar
Matthew Dizon 36 MINUTES AGO
) Feature Test: User Signup successfully logs in as non-admin
     Failure/Error: fill_in("password", :with => "password")

     Capybara::ElementNotFound:
       Unable to find visible field "password" that is not disabled
User avatar
Matthew Dizon 35 MINUTES AGO
see
Jad Abdallah 34 MINUTES AGO
it 'successfully logs in as non-admin' do

    # user_login method is defined in login_helper.rb
    create_standard_user
    visit '/signin'
    expect(current_path).to eq('/signin')
    user_login
    # binding.pry
User avatar
Jad Abdallah 33 MINUTES AGO
def user_login
    # binding.pry
    select 'Mindy',from:'user_name'
    # it breaks on the fill in password line below
    fill_in("password", :with => "password")
    click_button('Sign In')
  end
User avatar
Jad Abdallah 33 MINUTES AGO
it seems to be able to do the previous tests, and then breaks on that password line
User avatar
User avatar
Matthew Dizon 33 MINUTES AGO
can you revert your changes and change the line I provided
User avatar
Matthew Dizon 32 MINUTES AGO
I'd like to see if thats the error since it doesnt seem like a logic error but more so capybara
Jad Abdallah 31 MINUTES AGO
sure, do you mean like just to delete anything I've changed while we've been talking? or is revert changes an actual command like in bash?
User avatar
Jad Abdallah 31 MINUTES AGO
like learn save i mean
User avatar
User avatar
Matthew Dizon 31 MINUTES AGO
the former
Jad Abdallah 31 MINUTES AGO
ok i will
User avatar
User avatar
Matthew Dizon 30 MINUTES AGO
and just change the sign up password field to <%= f.password_field :stuck_out_tongue_winking_eye:assword %>
Jad Abdallah 28 MINUTES AGO
ok you mean in the create a new user view page or the current one with the error? this one is the sessions new, for signing in users who already are known to the system
User avatar
User avatar
Matthew Dizon 28 MINUTES AGO
the signup page
User avatar
Matthew Dizon 28 MINUTES AGO
not the new sessions
Jad Abdallah 27 MINUTES AGO
ok i just ran learn save
User avatar
User avatar
Matthew Dizon 26 MINUTES AGO
great run your tests
Jad Abdallah 26 MINUTES AGO
looks the same
User avatar
Jad Abdallah 26 MINUTES AGO
Failures:

  1) Feature Test: User Signup successfully logs in as non-admin
     Failure/Error: fill_in("password", :with => "password")

     Capybara::ElementNotFound:
       Unable to find visible field "password" that is not disabled
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/node/actions.rb:92:in `fill_in'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
     # /Users/jadabdallah/.rvm/gems/ruby-2.3.3/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/support/login_helper.rb:16:in `user_login'
     # ./spec/features/users_features_spec.rb:30:in `block (2 levels) in <top (required)>'
<!--
Isaac Villicana 7 MINUTES AGO
Hey Jad!
Jad Abdallah 7 MINUTES AGO
hey isaac how's it going
User avatar
User avatar
Isaac Villicana 7 MINUTES AGO
The test is looking to log in a user.
User avatar
Isaac Villicana 7 MINUTES AGO
Doing great, thanks!
User avatar
Isaac Villicana 7 MINUTES AGO
Once a user signs up as a login, they should be able to sign in
User avatar
Isaac Villicana 6 MINUTES AGO
i see that you are currently using a form_for in your new session view
User avatar
Isaac Villicana 5 MINUTES AGO
the problem with that is that it gives your input an id of "user_password" when we really just want "password"
Jad Abdallah 4 MINUTES AGO
oh that's why it says user_name here when I just put 'name' in the collection select
User avatar
Jad Abdallah 4 MINUTES AGO
def user_login
    # binding.pry
    select 'Mindy',from:'user_name'
    # it breaks on the fill in password line below
    fill_in("password", :with => "password")
    click_button('Sign In')
  end
User avatar
User avatar
Isaac Villicana 2 MINUTES AGO
yes.
User avatar
Isaac Villicana 2 MINUTES AGO
my suggestion would be to switch to a form_tag instead
Jad Abdallah A FEW SECONDS AGO
ok i'll try a form_tag
User avatar
Jad Abdallah A FEW SECONDS AGO
thanks -->
