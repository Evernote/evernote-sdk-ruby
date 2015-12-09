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

# insert resource GUID
resource_guid = "insert resource GUID here" 

# Returns a block of the extracted plain text contents of the resource with the provided GUID.
resource_search_text = note_store.getResourceSearchText(access_token , resource_guid)

puts "Resource search text data for the resource with GUID #{resource_guid}: \n\n#{resource_search_text}\n\n" 