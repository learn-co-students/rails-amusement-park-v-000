     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:41:in `process_and_follow_redirects'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:22:in `visit'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/driver.rb:44:in `visit'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/session.rb:274:in `visit'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/features/users_features_spec.rb:55:in `block (2 levels) in <top (required)>'

  7) Feature Test: User Signup on sign up for admin, successfully adds a session hash
     Failure/Error: visit '/users/new'
     
     ActionController::RoutingError:
       No route matches [GET] "/users/new"
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/method_override.rb:24:in `call'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/runtime.rb:24:in `call'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/sendfile.rb:113:in `call'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:77:in `block in call'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `each'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `call'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:41:in `process_and_follow_redirects'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:22:in `visit'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/driver.rb:44:in `visit'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/session.rb:274:in `visit'
     # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/features/users_features_spec.rb:65:in `block (2 levels) in <top (required)>'

  8) Feature Test: User Signup successfully logs in as admin
     Failure/Error:
       @mindy = User.create(
         name: "Mindy",
         password: "password",
         happiness: 3,
         nausea: 2,
         tickets: 10,
         height: 50
       )
     
     ActiveRecord::StatementInvalid:
       Could not find table 'users'
     # ./spec/support/login_helper.rb:44:in `create_standard_and_admin_user'
     # ./spec/features/users_features_spec.rb:72:in `block (2 levels) in <top (required)>'

  9) Feature Test: User Signup on log in, successfully adds a session hash to admins
     Failure/Error:
       @mindy = User.create(
         name: "Mindy",
         password: "password",
         happiness: 3,
         nausea: 2,
         tickets: 10,
         height: 50
       )
     
     ActiveRecord::StatementInvalid:
       Could not find table 'users'
     # ./spec/support/login_helper.rb:44:in `create_standard_and_admin_user'
     # ./spec/features/users_features_spec.rb:83:in `block (2 levels) in <top (required)>'

  10) Feature Test: User Signout has a link to log out from the users/show page
      Failure/Error: visit '/users/new'
      
      ActionController::RoutingError:
        No route matches [GET] "/users/new"
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/method_override.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/runtime.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/sendfile.rb:113:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:77:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `each'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:41:in `process_and_follow_redirects'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:22:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/driver.rb:44:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/session.rb:274:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:95:in `block (2 levels) in <top (required)>'

  11) Feature Test: User Signout redirects to home page after logging out
      Failure/Error: visit '/users/new'
      
      ActionController::RoutingError:
        No route matches [GET] "/users/new"
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/method_override.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/runtime.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/sendfile.rb:113:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:77:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `each'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:41:in `process_and_follow_redirects'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:22:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/driver.rb:44:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/session.rb:274:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:102:in `block (2 levels) in <top (required)>'

  12) Feature Test: User Signout successfully destroys session hash when 'Log Out' is clicked
      Failure/Error: visit '/users/new'
      
      ActionController::RoutingError:
        No route matches [GET] "/users/new"
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/method_override.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/runtime.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/sendfile.rb:113:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:77:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `each'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:41:in `process_and_follow_redirects'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:22:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/driver.rb:44:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/session.rb:274:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:110:in `block (2 levels) in <top (required)>'

  13) Feature Test: User Signout has a link to log out from the users/show page when user is an admin
      Failure/Error: visit '/users/new'
      
      ActionController::RoutingError:
        No route matches [GET] "/users/new"
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/method_override.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/runtime.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/sendfile.rb:113:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:77:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `each'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:41:in `process_and_follow_redirects'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:22:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/driver.rb:44:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/session.rb:274:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:118:in `block (2 levels) in <top (required)>'

  14) Feature Test: User Signout redirects to home page after admin logs out when user is an admin
      Failure/Error: visit '/users/new'
      
      ActionController::RoutingError:
        No route matches [GET] "/users/new"
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/method_override.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/runtime.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/sendfile.rb:113:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:77:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `each'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:41:in `process_and_follow_redirects'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:22:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/driver.rb:44:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/session.rb:274:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:125:in `block (2 levels) in <top (required)>'

  15) Feature Test: User Signout successfully destroys session hash when 'Log Out' is clicked as admin
      Failure/Error: visit '/users/new'
      
      ActionController::RoutingError:
        No route matches [GET] "/users/new"
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/method_override.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/runtime.rb:24:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/sendfile.rb:113:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:77:in `block in call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `each'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-2.1.2/lib/rack/urlmap.rb:61:in `call'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:41:in `process_and_follow_redirects'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:22:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/rack_test/driver.rb:44:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/session.rb:274:in `visit'
      # /home/useradd/.rvm/gems/ruby-2.6.3/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:133:in `block (2 levels) in <top (required)>'

  16) Feature Test: Go on a Ride has a link from the user show page to the attractions index page
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  17) Feature Test: Go on a Ride links from the user show page to the attractions index page
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  18) Feature Test: Go on a Ride prevents users from editing/deleting/adding rides on the index page
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  19) Feature Test: Go on a Ride has titles of the rides on the attractions index page
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  20) Feature Test: Go on a Ride has links on the attractions index page to the attractions' show pages
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  21) Feature Test: Go on a Ride links from the attractions index page to the attractions' show pages
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  22) Feature Test: Go on a Ride prevents users from editing/deleting a ride on the show page
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  23) Feature Test: Go on a Ride has a button from the attraction show page to go on the ride
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  24) Feature Test: Go on a Ride clicking on 'Go on ride' redirects to user show page
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  25) Feature Test: Go on a Ride clicking on 'Go on ride' updates the users ticket number
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  26) Feature Test: Go on a Ride clicking on 'Go on ride' updates the users mood
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  27) Feature Test: Go on a Ride when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  28) Feature Test: Go on a Ride when the user is too short, clicking on 'Go on ride' displays a sorry message
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  29) Feature Test: Go on a Ride when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  30) Feature Test: Go on a Ride when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:144:in `block (2 levels) in <top (required)>'

  31) Feature Test: Admin Flow displays admin when logged in as an admin on user show page
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  32) Feature Test: Admin Flow links to the attractions from the users show page when logged in as a admin
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  33) Feature Test: Admin Flow has a link from the user show page to the attractions index page when in admin mode
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  34) Feature Test: Admin Flow allows admins to add an attraction from the index page
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  35) Feature Test: Admin Flow allows admins to add an attraction
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  36) Feature Test: Admin Flow has link to attraction/show from attraction/index page for admins
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  37) Feature Test: Admin Flow does not suggest that admins go on a ride
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  38) Feature Test: Admin Flow links to attractions/show page from attractions/index
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  39) Feature Test: Admin Flow does not suggest that an admin go on a ride from attractions/show page
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  40) Feature Test: Admin Flow has a link for admin to edit attraction from the attractions/show page
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  41) Feature Test: Admin Flow links to attraction/edit page from attraction/show page when logged in as an admin
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  42) Feature Test: Admin Flow updates an attraction when an admin edits it
      Failure/Error:
        @rollercoaster = Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/features/users_features_spec.rb:282:in `block (2 levels) in <top (required)>'

  43) Attraction is valid with a name, min_height, nausea_rating, happiness_rating, and ticket number
      Failure/Error:
        Attraction.create(
          :name => "Roller Coaster",
          :tickets => 5,
          :nausea_rating => 2,
          :happiness_rating => 4,
          :min_height => 32
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'attractions'
      # ./spec/models/attraction_spec.rb:5:in `block (2 levels) in <main>'
      # ./spec/models/attraction_spec.rb:15:in `block (2 levels) in <main>'

  44) Attraction has many rides
      Failure/Error: user = User.create(name: "Max Charles", password: "password")
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/attraction_spec.rb:19:in `block (2 levels) in <main>'

  45) Attraction has many users through rides
      Failure/Error: max = User.create(name: "Max Charles", password: "password")
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/attraction_spec.rb:25:in `block (2 levels) in <main>'

  46) Ride is valid with a user_id and a attraction_id
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/ride_spec.rb:15:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:26:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:30:in `block (2 levels) in <main>'

  47) Ride belongs to one attraction
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/ride_spec.rb:15:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:26:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:34:in `block (2 levels) in <main>'

  48) Ride belongs to one user
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/ride_spec.rb:15:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:26:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:38:in `block (2 levels) in <main>'

  49) Ride has a method 'take_ride' that accounts for the user not having enough tickets
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/ride_spec.rb:15:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:42:in `block (2 levels) in <main>'

  50) Ride has a method 'take_ride' that accounts for the user not being tall enough
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/ride_spec.rb:15:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:50:in `block (2 levels) in <main>'

  51) Ride has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/ride_spec.rb:15:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:59:in `block (2 levels) in <main>'

  52) Ride has a method 'take_ride' that updates ticket number
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/ride_spec.rb:15:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:68:in `block (2 levels) in <main>'

  53) Ride has a method 'take_ride' that updates the user's nausea
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/ride_spec.rb:15:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:76:in `block (2 levels) in <main>'

  54) Ride has a method 'take_ride' that updates the user's happiness
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/ride_spec.rb:15:in `block (2 levels) in <main>'
      # ./spec/models/ride_spec.rb:84:in `block (2 levels) in <main>'

  55) User is valid with a name, password, happiness, nausea, height, and tickets
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/user_spec.rb:5:in `block (2 levels) in <main>'
      # ./spec/models/user_spec.rb:48:in `block (2 levels) in <main>'

  56) User is not valid without a password
      Failure/Error: expect(User.new(name: "Name")).not_to be_valid
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/user_spec.rb:52:in `block (2 levels) in <main>'

  57) User is valid with an admin boolean
      Failure/Error:
        User.create(
          :name => "Walt",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34,
          :admin => true
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/user_spec.rb:16:in `block (2 levels) in <main>'
      # ./spec/models/user_spec.rb:56:in `block (2 levels) in <main>'

  58) User defaults to admin => false
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/user_spec.rb:5:in `block (2 levels) in <main>'
      # ./spec/models/user_spec.rb:60:in `block (2 levels) in <main>'

  59) User has many rides
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/user_spec.rb:5:in `block (2 levels) in <main>'
      # ./spec/models/user_spec.rb:64:in `block (2 levels) in <main>'

  60) User has many attractions through rides
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/user_spec.rb:5:in `block (2 levels) in <main>'
      # ./spec/models/user_spec.rb:71:in `block (2 levels) in <main>'

  61) User has a method 'mood' that returns 'sad' when the user is more nauseous than happy
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/user_spec.rb:5:in `block (2 levels) in <main>'
      # ./spec/models/user_spec.rb:77:in `block (2 levels) in <main>'

  62) User has a method 'mood' that returns 'happy' when the user is more happy than nauseous
      Failure/Error:
        User.create(
          :name => "Mindy",
          :password => "password",
          :nausea => 5,
          :happiness => 3,
          :tickets => 4,
          :height => 34
        )
      
      ActiveRecord::StatementInvalid:
        Could not find table 'users'
      # ./spec/models/user_spec.rb:5:in `block (2 levels) in <main>'
      # ./spec/models/user_spec.rb:81:in `block (2 levels) in <main>'

Finished in 1.14 seconds (files took 41.51 seconds to load)
62 examples, 62 failures

Failed examples:

FEATURES:
rspec ./spec/features/users_features_spec.rb:4 # Feature Test: User Signup successfully signs up as non-admin
rspec ./spec/features/users_features_spec.rb:17 # Feature Test: User Signup on sign up, successfully adds a session hash
rspec ./spec/features/users_features_spec.rb:24 # Feature Test: User Signup successfully logs in as non-admin
rspec ./spec/features/users_features_spec.rb:39 # Feature Test: User Signup on log in, successfully adds a session hash
rspec ./spec/features/users_features_spec.rb:47 # Feature Test: User Signup prevents user from viewing user show page and redirects to home page if not logged in
rspec ./spec/features/users_features_spec.rb:54 # Feature Test: User Signup successfully signs up as admin
rspec ./spec/features/users_features_spec.rb:64 # Feature Test: User Signup on sign up for admin, successfully adds a session hash
rspec ./spec/features/users_features_spec.rb:71 # Feature Test: User Signup successfully logs in as admin
rspec ./spec/features/users_features_spec.rb:82 # Feature Test: User Signup on log in, successfully adds a session hash to admins
rspec ./spec/features/users_features_spec.rb:94 # Feature Test: User Signout has a link to log out from the users/show page
rspec ./spec/features/users_features_spec.rb:101 # Feature Test: User Signout redirects to home page after logging out
rspec ./spec/features/users_features_spec.rb:109 # Feature Test: User Signout successfully destroys session hash when 'Log Out' is clicked
rspec ./spec/features/users_features_spec.rb:117 # Feature Test: User Signout has a link to log out from the users/show page when user is an admin
rspec ./spec/features/users_features_spec.rb:124 # Feature Test: User Signout redirects to home page after admin logs out when user is an admin
rspec ./spec/features/users_features_spec.rb:132 # Feature Test: User Signout successfully destroys session hash when 'Log Out' is clicked as admin
rspec ./spec/features/users_features_spec.rb:169 # Feature Test: Go on a Ride has a link from the user show page to the attractions index page
rspec ./spec/features/users_features_spec.rb:174 # Feature Test: Go on a Ride links from the user show page to the attractions index page
rspec ./spec/features/users_features_spec.rb:179 # Feature Test: Go on a Ride prevents users from editing/deleting/adding rides on the index page
rspec ./spec/features/users_features_spec.rb:187 # Feature Test: Go on a Ride has titles of the rides on the attractions index page
rspec ./spec/features/users_features_spec.rb:193 # Feature Test: Go on a Ride has links on the attractions index page to the attractions' show pages
rspec ./spec/features/users_features_spec.rb:199 # Feature Test: Go on a Ride links from the attractions index page to the attractions' show pages
rspec ./spec/features/users_features_spec.rb:205 # Feature Test: Go on a Ride prevents users from editing/deleting a ride on the show page
rspec ./spec/features/users_features_spec.rb:212 # Feature Test: Go on a Ride has a button from the attraction show page to go on the ride
rspec ./spec/features/users_features_spec.rb:219 # Feature Test: Go on a Ride clicking on 'Go on ride' redirects to user show page
rspec ./spec/features/users_features_spec.rb:226 # Feature Test: Go on a Ride clicking on 'Go on ride' updates the users ticket number
rspec ./spec/features/users_features_spec.rb:233 # Feature Test: Go on a Ride clicking on 'Go on ride' updates the users mood
rspec ./spec/features/users_features_spec.rb:240 # Feature Test: Go on a Ride when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message
rspec ./spec/features/users_features_spec.rb:247 # Feature Test: Go on a Ride when the user is too short, clicking on 'Go on ride' displays a sorry message
rspec ./spec/features/users_features_spec.rb:257 # Feature Test: Go on a Ride when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message
rspec ./spec/features/users_features_spec.rb:267 # Feature Test: Go on a Ride when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message
rspec ./spec/features/users_features_spec.rb:307 # Feature Test: Admin Flow displays admin when logged in as an admin on user show page
rspec ./spec/features/users_features_spec.rb:311 # Feature Test: Admin Flow links to the attractions from the users show page when logged in as a admin
rspec ./spec/features/users_features_spec.rb:315 # Feature Test: Admin Flow has a link from the user show page to the attractions index page when in admin mode
rspec ./spec/features/users_features_spec.rb:322 # Feature Test: Admin Flow allows admins to add an attraction from the index page
rspec ./spec/features/users_features_spec.rb:327 # Feature Test: Admin Flow allows admins to add an attraction
rspec ./spec/features/users_features_spec.rb:341 # Feature Test: Admin Flow has link to attraction/show from attraction/index page for admins
rspec ./spec/features/users_features_spec.rb:346 # Feature Test: Admin Flow does not suggest that admins go on a ride
rspec ./spec/features/users_features_spec.rb:351 # Feature Test: Admin Flow links to attractions/show page from attractions/index
rspec ./spec/features/users_features_spec.rb:357 # Feature Test: Admin Flow does not suggest that an admin go on a ride from attractions/show page
rspec ./spec/features/users_features_spec.rb:363 # Feature Test: Admin Flow has a link for admin to edit attraction from the attractions/show page
rspec ./spec/features/users_features_spec.rb:369 # Feature Test: Admin Flow links to attraction/edit page from attraction/show page when logged in as an admin
rspec ./spec/features/users_features_spec.rb:376 # Feature Test: Admin Flow updates an attraction when an admin edits it


****************************************************************************************************

MODELS:


Attraction Model:
rspec ./spec/models/attraction_spec.rb:14 # Attraction is valid with a name, min_height, nausea_rating, happiness_rating, and ticket number
rspec ./spec/models/attraction_spec.rb:18 # Attraction has many rides*
rspec ./spec/models/attraction_spec.rb:24 # Attraction has many users through rides*


Ride Model:
rspec ./spec/models/ride_spec.rb:29 # Ride is valid with a user_id and a attraction_id
rspec ./spec/models/ride_spec.rb:33 # Ride belongs to one attraction*
rspec ./spec/models/ride_spec.rb:37 # Ride belongs to one user*
rspec ./spec/models/ride_spec.rb:41 # Ride has a method 'take_ride' that accounts for the user not having enough tickets
rspec ./spec/models/ride_spec.rb:49 # Ride has a method 'take_ride' that accounts for the user not being tall enough
rspec ./spec/models/ride_spec.rb:58 # Ride has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
rspec ./spec/models/ride_spec.rb:67 # Ride has a method 'take_ride' that updates ticket number
rspec ./spec/models/ride_spec.rb:75 # Ride has a method 'take_ride' that updates the user's nausea
rspec ./spec/models/ride_spec.rb:83 # Ride has a method 'take_ride' that updates the user's happiness



User Model:
rspec ./spec/models/user_spec.rb:47 # User is valid with a name, password, happiness, nausea, height, and tickets
rspec ./spec/models/user_spec.rb:51 # User is not valid without a password
rspec ./spec/models/user_spec.rb:55 # User is valid with an admin boolean
rspec ./spec/models/user_spec.rb:59 # User defaults to admin => false
rspec ./spec/models/user_spec.rb:63 # User has many rides
rspec ./spec/models/user_spec.rb:70 # User has many attractions through rides
rspec ./spec/models/user_spec.rb:76 # User has a method 'mood' that returns 'sad' when the user is more nauseous than happy
rspec ./spec/models/user_spec.rb:80 # User has a method 'mood' that returns 'happy' when the user is more happy than nauseous