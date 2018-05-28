## Users
- Attributes
	- name - string
	- nausea - int
	- happiness - int
	- tickets - int
	- height - int
	- password - string
	- admin - boolean (defaults to false)


## Attraction
- Attributes
	- name - string
	- tickets - int
	- nausea_rating - int
	- happiness_rating - int
	- min_height - int


## Ride (Join Table)
- Attributes
	- user_id
	- attraction_id

