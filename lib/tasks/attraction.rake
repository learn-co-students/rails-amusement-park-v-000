Attraction.where("boolean_column = 't'").update_all(boolean_column: 1)
Attraction.where("boolean_column = 'f'").update_all(boolean_column: 0)
