
[1mFrom:[0m /mnt/c/code/rails-amusement-park-v-000/app/controllers/users_controller.rb @ line 34 UsersController#show:

    [1;34m29[0m: [32mdef[0m [1;34mshow[0m
    [1;34m30[0m:   @user = [1;34;4mUser[0m.find(params[[33m:id[0m])
    [1;34m31[0m:   [32mif[0m session[[33m:user_id[0m] != @user.id
    [1;34m32[0m:     redirect_to [31m[1;31m'[0m[31m/[1;31m'[0m[31m[0m
    [1;34m33[0m:   [32melse[0m
 => [1;34m34[0m:     binding.pry
    [1;34m35[0m:     [1;36mself[0m.ride.start_ride
    [1;34m36[0m:   [32mend[0m
    [1;34m37[0m: [32mend[0m

