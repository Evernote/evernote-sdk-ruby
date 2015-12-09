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

# GUID of the note to retrive the tag names of
note_guid= "insert note GUID to get the attached list names here"

# Returns a list of tag name that are attached to the note
attached_tags = note_store.getNoteTagNames(access_token , note_guid)


print "Note has #{attached_tags.length} tag(s) attached:" 
attached_tags.each do |tag|
	print "   *#{tag}"
end
