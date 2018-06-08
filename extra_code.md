from attractions#show

<!--<%= #link_to "Back", attractions_path, class: "btn btn-primary btn-light" %><br>-->

<% if @user.errors.any? %>
	<div id="error_explanation">
		<h2>
			<%= pluralize(@user.errors.count, "error") %> prohibited this user from being saved: </h2>
		<ul>
			<% @user.errors.full_messages.each do |message| %>
			<li><%= message %></li>
			<% end %>
		</ul>
	</div>
	<% end %>

from home.html.erb:
<div class="center">
			<%= link_to "Sign In", signin_path, class: "btn btn-primary" %>
			<%= link_to "Sign Up", new_user_path, class: "btn btn-primary" %>
		</div>

		from sessions#new

		<div class="form-group">
		<%= f.label :name, 'Your name' %><br>
		<%= f.text_field :name, class: "form-control" %>
	</div>