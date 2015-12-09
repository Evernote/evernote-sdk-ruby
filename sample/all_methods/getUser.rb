# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your dev or oauth token"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get user store object
user_store = client.user_store

# Get user
user = user_store.getUser

#Map service level enum to desciption string
service_level = Evernote::EDAM::Type::ServiceLevel::VALUE_MAP[user.serviceLevel]

puts "#{user.username}'s user ID is #{user.id}."
puts "#{user.username} is a #{service_level} user." 


if user.accounting.businessId then
	puts "#{user.username} is a part of the #{user.accounting.businessName} business!" 
end