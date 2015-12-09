# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert dev or oauth token here"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# GUID of the tag to be retrived
tag_guid =  'enter the GUID of the tag to be retrived here'

# Removes the provided tag from every note that is currently tagged with this tag. 
# If this operation is successful, the tag will still be in the account, but it will not be tagged on any notes.
note_store.untagAll(access_token,tag_guid)

puts "Untagged all notes with the tag GUID #{tag_guid}." 