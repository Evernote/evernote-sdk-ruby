# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your access toekn"


# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store


# The global ID of the notebook as indicated by the linked notebook object attribute "sharedNotebookGlobalId"
notebook_global_id = "insert sharedNotebookGlobalID"


# Returns a share key to join to the note via the API to other users
# (see authenticateToSharedNote)
# and/or to create a public link to the note
auth_result = note_store.authenticateToSharedNotebook( notebook_global_id, access_token )

if auth_result.authenticationToken then
	#create a new note store object corresponding to the note store that contians the shared note
	shared_note_store = client.shared_note_store(token:auth_result.authenticationToken,sandbox:true)
	#Get the shared note (see getNote for more information)
	shared_notebook = shared_note_store.getNotebook(note_guid, true, true, true, true)

	puts "The notebook shared to this user has the name '#{shared_notebook.name}'" 

else
	puts "authentication failed"
end