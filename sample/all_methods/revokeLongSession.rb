# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert dev or oauth token here"


# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
user_store = client.user_store


# Get the user's URLs
user_urls = user_store.revokeLongSession(access_token)

puts "The access token\n\n     #{access_token}\n\nhas been revoked\n" 
puts "You can no longer call the Evernote API with the above access token"