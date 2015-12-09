# Import the Evernote client
require 'evernote_oauth' 


# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)
access_token =  "insert dev or oauth token here"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# Create the tag object
tag = Evernote::EDAM::Type::Tag.new
# Set the name of thypes.Tag()e tag
tag.name = "This is a test tag"

# Uncomment the next line to set the (optional) parent tag GUID
#tag.parentGuid = "insert parent tag GUID here"

# Returns a the tag object as created by the Evernote service
# properties such as "guid", etc. will be filled in by the service.
tag = note_store.createTag( access_token,tag )
