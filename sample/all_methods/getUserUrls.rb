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

# Get the user's URLs
user_urls = user_store.getUserUrls

puts "This user's note store URL is #{user_urls.noteStoreUrl}" 
puts "This user's user store URL is #{user_urls.userStoreUrl}" 
