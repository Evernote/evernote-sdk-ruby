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

# Returns a list of linked notebooks 
shared_notebooks = note_store.listSharedNotebooks

puts "Found #{shared_notebooks.length} shared notebooks:" 
shared_notebooks.each do |notebook|
	puts "   * notebook.globalId"
end
