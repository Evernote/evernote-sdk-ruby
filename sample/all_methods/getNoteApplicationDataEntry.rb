# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your dev or oauth token here"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# GUID of the note to attach the application data to
note_guid= "70f0ff07-dace-4649-a1c6-fd9fff54360e"

# Key of the application data entry to retrive
key = "whammy1106-7767"

#Returns a lazy map of all the application data associated with the note
application_data_value = note_store.getNoteApplicationDataEntry(access_token, note_guid, key)	

puts  "Application data entry for key #{key} is #{application_data_value}." 