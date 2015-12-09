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

# GUID of the note to attach the application data to
note_guid = "insert note guid "

# Key of the application data entry to retrive
key = "insert your key of application"

#Returns the usn (update service number) of the update
usn = note_store.unsetNoteApplicationDataEntry(access_token, note_guid, key)

print "Application data entry for note GUID #{note_guid} and key '#{key}' has been unset (USN #{usn})." 