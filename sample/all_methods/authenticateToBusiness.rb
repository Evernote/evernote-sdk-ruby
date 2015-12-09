# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your access token"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
user_store = client.user_store

# Call authenticateToBusiness
business_authentication_result = user_store.authenticateToBusiness(access_token)

business_authentication_token = business_authentication_result.authenticationToken
business_note_store_url = business_authentication_result.noteStoreUrl

puts "The business authentication token is:    #{business_authentication_token}" 
puts "and the business note store URL is     #{business_note_store_url}" 

puts "You can use the above note store URL and business authentication token to access the business note store on behalf of the user!"
puts "For more information see https://dev.evernote.com/doc/articles/business.php"