
[1mFrom:[0m /home/learn/code/labs/rails-amusement-park-v-000/app/controllers/users_controller.rb @ line 11 UsersController#create:

    [1;34m10[0m: [32mdef[0m [1;34mcreate[0m
 => [1;34m11[0m:     binding.pry
    [1;34m12[0m:     @user=[1;34;4mUser[0m.new(user_params)
    [1;34m13[0m:     binding.pry
    [1;34m14[0m:     [32mif[0m @user.valid?
    [1;34m15[0m:         session[[33m:user_id[0m]=@user.id
    [1;34m16[0m:         binding.pry
    [1;34m17[0m:         redirect_to user_path(@user)
    [1;34m18[0m:     [32melse[0m
    [1;34m19[0m:         render [33m:new[0m
    [1;34m20[0m:     [32mend[0m
    [1;34m21[0m: [32mend[0m

