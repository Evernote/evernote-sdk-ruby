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


# GUID of the tag to be retrived
tag_guid = 'enter the GUID of the tag to be retrived here'

# Returns the current state of the Tag with the provided GUID.
tag = note_store.getTag(access_token, tag_guid)

puts "Retrived tag with the name #{tag.name} and GUID #{tag.guid}." 