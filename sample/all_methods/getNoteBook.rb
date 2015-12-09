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

# GUID of the notebook to retrive
notebook_guid = "insert GUID of notebook here"

# Returns a notebook corresponding to the supplied GUID
notebook = note_store.getNotebook(access_token, notebook_guid)


print "Retrived notebook with title of '#{notebook.name}'." 