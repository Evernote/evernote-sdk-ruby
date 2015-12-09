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

# GUID of the note to retrive the contents of
note_guid= "insert note GUID to retrive the contents here"

# Returns ENML contents of the note with the provided GUID
# For more informaiton on ENML see https://dev.evernote.com/doc/articles/enml.php
enml_note_contents = note_store.getNoteContent(access_token, note_guid)

puts "ENML of note with GUID #{note_guid}: \n\n#{enml_note_contents}\n\n" 