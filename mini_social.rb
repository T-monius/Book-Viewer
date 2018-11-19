# mini_social.rb
# This application is a product of the  Launchschool 170 Users
# and Interests `Code Challenge`

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
  @user_info = YAML.load_file('public/users.yaml')
end

get '/' do
  @users = @user_info.keys

  erb :home
end
