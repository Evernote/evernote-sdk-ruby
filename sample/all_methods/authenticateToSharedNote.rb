# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your access token"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# The GUID of the note to authenticate to
note_guid = "insert the guid of the note to authenticate to here"

# The share key of the note which is returned by the shareNote call of the owner of the note
note_share_key = "insert the share key of the note here"


# Returns a share key to join to the note via the API to other users
# (see authenticateToSharedNote)
# and/or to create a public link to the note
auth_result = note_store.authenticateToSharedNote(note_guid, note_share_key)

if auth_result.authenticationToken then 
	#create a new note store object corresponding to the note store that contians the shared note
	shared_note_store =  client.shared_note_store(token:auth_result.authenticationToken,sandbox:true)
	
	#Get the shared note (see getNote for more information)
	shared_note = shared_note_store.getNote(note_guid, True, True, True, True)

	puts "Note successfully recivied"
	puts "The note shared to this user has the title #{shared_note.title}" 

else
	puts "authentication failed"
end