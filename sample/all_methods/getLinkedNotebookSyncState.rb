# Import the Evernote client
require 'evernote_oauth' 

# import time class
require 'time'

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert dev or oauth token here"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# Get a list of linked notebooks 
# for more info see listLinkedNotebooks
linked_notebooks = note_store.listLinkedNotebooks

# Filter to just get notebooks that are not a part of the user's business
# if you need to sync business content authenticate to business first and then
# call getSyncState and getFilteredSyncChunk on the business note store
# Get business ID
business_id = client.user_store.getUser.accounting.businessId
# Filter out all business notebooks that are from the user's business
if business_id != nil then
	linked_notebooks.select{|lknb| lknb.businessId != business_id }	
end

# Get a indivudual linked notebook
linked_notebook = linked_notebooks[0]

# Returns a sync state object that contains information on the sync state of the linked notebook
# including the USN, the monotomically increseaing integer to indicate when updates have
# occured as indicated by the Evernote service
sync_state = note_store.getLinkedNotebookSyncState(access_token,linked_notebook)

print "The USN at #{Time.at(sync_state.currentTime/1000).to_i} for the linked notebook #{linked_notebook.shareName} is #{sync_state.updateCount}."   