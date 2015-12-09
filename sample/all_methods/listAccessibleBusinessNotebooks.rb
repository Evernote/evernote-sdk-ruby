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

# Returns a list of all the notebooks in a business that the user has permission to access, 
# regardless of whether the user has joined them. This includes notebooks that have been shared 
# with the entire business as well as notebooks that have been shared directly with the user.

accessible_business_notebooks = note_store.listAccessibleBusinessNotebooks
	

puts "Found #{accessible_business_notebooks.length} accessible business notebooks:" 
accessible_business_notebooks.each do |notebook|
	puts "   * '#{notebook.name}'" 
end

