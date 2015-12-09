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

# Get a list of personal notebooks 
notebooks = note_store.listNotebooks

# Get a notebook object
# If you already have on in your code you can start here
notebook = notebooks[0]

# Make updates to the notebook object
notebook.name = "this is a new name for the notebook"
notebook.stack = "this is a test stack"

#Returns the usn (update service number) of the update
usn = note_store.updateNotebook(access_token, notebook)

print "The notebook with the name '#{notebook.name}' has been updated (USN #{usn})."