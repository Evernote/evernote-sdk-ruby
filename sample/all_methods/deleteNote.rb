# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)
access_token = "insert dev or oauth token here"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# Insert the GUID of the note that is to be moved to the trash
note_guid = "Insert the GUID of the note to be deleted"

# Call the deleteNote method on the corresponding note store to move
# the note to the trash
note_store.deleteNote( access_token,note_guid )