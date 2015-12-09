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

# insert saved search GUID
# to get a list of saved searches and their GUIDs
# see listSearches or createSearch
saved_search_guid = "insert saved search guid"

# Returns the current state of the search with the provided GUID.
saved_search = note_store.getSearch(access_token , saved_search_guid)

puts "Retrived saved search named #{saved_search.name} with query '#{saved_search.query}'" 