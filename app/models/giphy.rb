require 'twilio-ruby'
require 'giphy'

account_sid = 'ACaa0a2ceb8411bb4aa9348dc3d00558f0'
auth_token = '373c5b9d1d7c5bd7a9dc2cce087b0dcd'
    @lgif = Giphy.random("pikachu").image_original_url
    
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => "+19283251586",
      :to => "+14805407684",
      :body => "hello",
      :media_url => "https://media.giphy.com/media/5cqikIt2W5NjG/giphy.gif",
    })
    



