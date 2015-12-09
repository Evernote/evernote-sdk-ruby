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

# Define the notebook GUID you wish to get the tags of
notebook_guid = "insert the GUID of the notebook"

# Returns a list of linked notebooks 
tags = note_store.listTagsByNotebook(access_token, notebook_guid)

print "Found #{tags.length} tags attached to notes in the notebook with the GUID #{notebook_guid}" 
tags.each do |tag|
	puts "#{tag.name}"
end
