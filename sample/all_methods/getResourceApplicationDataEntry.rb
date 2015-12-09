# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your dev or oauth token"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# GUID of the note to attach the application data to
resource_guid = "insert your resource guid "

# Key of the application data entry to retrive
key = "insert your key of data entry"

#Returns a lazy map of all the application data associated with the note
application_data_value = note_store.getResourceApplicationDataEntry(access_token , resource_guid, key)

print "Application data entry for key #{key} is #{application_data_value}." 