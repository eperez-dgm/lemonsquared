require './config/environment'
require './app/models/model'
require 'giphy'

class ApplicationController < Sinatra::Base

# this helps connect our public and views directories
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

account_sid = 'ACaa0a2ceb8411bb4aa9348dc3d00558f0'
auth_token = '373c5b9d1d7c5bd7a9dc2cce087b0dcd'

  get '/' do 
    erb :index
  end
  
  post '/results' do
    @num = params[:number]
    @lgif = Giphy.random("lemon").image_original_url
    
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create({
      :to => @num,
      :body => "Hey there",
      :media_url => @lgif,
      :from => "+19283251586",
    })
     erb :results
  end
end


