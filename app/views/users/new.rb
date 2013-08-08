<h1>Sign Up!</h1>
  <div>
    <%= form_for User.new do |f| %>
      <%= f.label :email %>
      <%= f.text_field :email %>

      <%= f.label :password %>
      <%= f.password_field :password %>

      <%= f.label :password_confirmation %>
      <%= f.password_field :password_confirmation %>

      <%= f.submit "Sign Up" %>
    <%= end %>
  </div>

 <h1> Log In! </h1>
  <div>
    <%= form_for :session, url: sessions_path do |f| %>
      <%= f.label :email %>
      <%= f.text_field :email %>

      <%= f.label :password %>
      <%= f.password_field :password %>

      <%= f.submit "Sign In" %>
    <%= end %>
   </div>    
