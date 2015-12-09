# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your dev or aouth token"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# GUID of the note to attach the application data to
note_guid =  "70f0ff07-dace-4649-a1c6-fd9fff54360e"

# Value of the key for the storage
# 3rd party apps are only allowed 1
key = "insert key for storage"

# the value of the application data entry
# containg a string arbitray length 
value = "this is the value of the application data"

# Each note is given this 4kb map of arbitrary data, shared by all third-party applications.
# adding new data may cause the field's value to exceed the the 4kb limit. 
# In this case, an instance of EDAMUserException is thrown with the BAD_DATA_FORMAT error code. 
# Setting this value will overwrite any existing data
usn = note_store.setNoteApplicationDataEntry(access_token, note_guid, key, value)

puts "Application data set for note with GUID, '#{note_guid}' with the key '#{key}' and value '#{usn}' (USN %s)" 