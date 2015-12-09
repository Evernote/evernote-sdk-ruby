# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your dev or oauth token"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# Returns a list of linked notebooks 
all_linked_notebooks = note_store.listLinkedNotebooks

# Filter to just get notebooks that are not a part of the user's business
# if you need to sync business content authenticate to business first and then
# call getSyncState and getFilteredSyncChunk on the business note store
# Get business ID
business_id = client.user_store.getUser.accounting.businessId
# Filter out all business notebooks that are from the user's business
if business_id  then
	all_linked_notebooks.select{|lknb| lknb.businessId != business_id }
end

puts "Found #{all_linked_notebooks.length} linked notebooks:" 

all_linked_notebooks.each do |notebook|
	puts "   * #{notebook.shareName}"
    puts "   * #{notebook.sharedNotebookGlobalId}"
end
