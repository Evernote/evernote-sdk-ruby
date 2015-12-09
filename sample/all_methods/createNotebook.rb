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

# Create the Notebook object
notebook = Evernote::EDAM::Type::Notebook.new
# Set the name of the notebook
notebook.name = "This is a test notebook"

# Returns a the notebook object as created by the Evernote service
# properties such as "guid", etc. will be filled in by the service.
notebook = note_store.createNotebook(access_token ,notebook)