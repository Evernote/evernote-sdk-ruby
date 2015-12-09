# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token =  "insert dev or oauth token here"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
user_store = client.user_store

# Call authenticateToBusiness
version_ok = user_store.checkVersion("Evernote Test (Ruby)", 
	Evernote::EDAM::UserStore::EDAM_VERSION_MAJOR, 
	Evernote::EDAM::UserStore::EDAM_VERSION_MINOR)

if version_ok then
	puts "Your Evernote client is compatible with Evernote's current service!"
else
	puts "Your Evernote client is out of date, please upgrade your client"
end