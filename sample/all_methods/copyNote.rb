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

# The GUID of the note to be copied
note_guid_to_copy = "insert note guid to be copied"

# The GUID of the destination notebook
destination_notebook_guid= "insert the GUID of the notebook that the note will be copied to"

# Returns a the copied note object
copied_note = note_store.copyNote( access_token,note_guid_to_copy, destination_notebook_guid )