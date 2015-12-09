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

# Get a list of linked notebooks 
# for more info see listLinkedNotebooks
linked_notebooks = note_store.listLinkedNotebooks

# Filter to just get notebooks that are not a part of the user's business
# if you need to sync business content authenticate to business first and then
# call getSyncState and getFilteredSyncChunk on the business note store
# Get business ID
business_id = client.user_store.getUser.accounting.businessId
# Filter out all business notebooks that are from the user's business
if business_id then 
	linked_notebooks.select {|lknb| lknb.businessId != business_id}
end

# Get a linked notebook object
# If you already have on in your code you can start here
linked_notebook = linked_notebooks[0]

# Make updates to the linked notebook object
linked_notebook.shareName = "this is a new name for the linked notebook"
linked_notebook.stack = "this is a test stack"

#Returns the usn (update service number) of the update
usn = note_store.updateLinkedNotebook(access_token,linked_notebook)

puts "The linked notebook with the name '#{linked_notebook.shareName}' has been updated (USN #{usn})." 