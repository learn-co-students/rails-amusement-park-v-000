class SessionsController < ApplicationController
  def new

  end

  def create
    raise params.inspect

    # So, the params below show that the users[name]
    # param is assigned to the user's id. I need to
    # change the form to make sure the params reflect
    # user[id] = user.id instead.  Instead of doing a
    # form_for I could just do a form_tag and explicitly
    # call the collection select and then add a pw field

    #      RuntimeError:
       # <ActionController::Parameters {"utf8"=>"✓", "user"=>{"name"=>"1", "password"=>"password"}, "commit"=>"Sign In", "controller"=>"sessions", "action"=>"create"} permitted: false>
       #
  end
end
