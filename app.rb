require 'sinatra'



get '/' do
  erb :index
end

get '/index.html' do
  erb :index
end



get '/about.html' do
    erb :about
end

get '/solutions.html'do
    erb :solutions
end

get '/portfolio.html' do
    erb :portfolio
end

get '/room.html' do
    erb :room
end

get '/contact.html' do
    erb :contact
end





post '/mail' do
  require 'pony'
  person = params
  name = person["name"]
  email = person["email"]
  message = person["message"]


  Pony.mail({
    :to => 'e@chipay.io',
    :from => email,
    :subject => "#{name}   has contacted you about Chi.Software",
    :body => "\n \n #{message} \n sent from #{name}",
    :via => :smtp,
    :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
    })




end

run Sinatra::Application.run!
