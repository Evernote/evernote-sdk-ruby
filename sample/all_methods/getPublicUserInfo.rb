# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your access token"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)


# Get user store object
user_store = client.user_store

# Get public user info
username = "your name"

public_user_info = user_store.getPublicUserInfo(username)

service_level = Evernote::EDAM::Type::ServiceLevel::VALUE_MAP[public_user_info.serviceLevel]
user_id = public_user_info.userId
note_store_url = public_user_info.noteStoreUrl

puts "#{username}'s user ID is #{user_id}"
puts "#{username} is a #{service_level} user whose personal note store URL is #{note_store_url}"