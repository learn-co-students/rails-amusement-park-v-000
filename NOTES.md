[]   1) Feature Test: User Signup successfully logs in as non-admin
     Failure/Error: <p><strong>Your name: </strong><%= select_tag "user_name", options_from_collection_for_select(@users, "user_id", "name"), prompt: 'Please select your username from this dropdown' %></p>
     
     ActionView::Template::Error:
       undefined method `user_id' for #<User:0x00007fb9d62d8a60>

[] use password tags for passwords