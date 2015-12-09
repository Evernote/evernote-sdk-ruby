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

# Returns the current state of the search with the provided GUID.
saved_searches = note_store.listSearches

print "Found #{saved_searches.length} saved searches:"
saved_searches.each do |search|
	puts "   '#{search.query}'"
end
