Ride.where("boolean_column = 't'").update_all(boolean_column: 1)
Ride.where("boolean_column = 'f'").update_all(boolean_column: 0)
