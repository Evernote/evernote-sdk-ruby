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

# Get the tag (see getTag for more info)
tag = note_store.getTag(access_token,tag_guid)

# Update tag
tag.name = "Newly updated tag name"
#tag.parentGuid = "Insert parent tag GUID here"

# Submits tag changes to the service. 
# The provided data must include the tag's guid field for identification. 
# The service will apply updates to the following tag fields: name, parentGuid
usn = note_store.updateTag(access_token,tag)

puts "Updated tag with the name '#{tag.name}' (USN #{usn})." 