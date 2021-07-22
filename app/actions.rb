def humanized_time_ago(time_ago_in_minutes)
  if time_ago_in_minutes >= 60
    "#{time_ago_in_minutes / 60} hours ago"
  else
    "#{time_ago_in_minutes} minutes ago"
  end
end

get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end


get '/signup' do     
  @user = User.new   
  erb(:signup)       
end

# create a user
post '/signup' do
   email      = params[:email]
   avatar_url = params[:avatar_url]
   username   = params[:username]
   password   = params[:password]
 
  
   user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
   
   user.save
 
   # return readable representation of User object
   escape_html user.inspect
end