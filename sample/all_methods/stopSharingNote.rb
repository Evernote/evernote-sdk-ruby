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

# The GUID of the note to be un-shared.
note_to_unshare_guid= "note guid to unshare"

# If this note is shared publicly then this will stop sharing that note and invalidate its "Note Key", 
# so any existing URLs to access that Note will stop working.
# If the Note is not shared, then this function will do nothing.
# Returns nothing
share_note_key = note_store.stopSharingNote(note_to_unshare_guid)

puts "You have sucsessfully unshared the note with GUID '#{note_to_unshare_guid}'." 