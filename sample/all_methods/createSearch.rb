# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)
access_token = "insert dev or oauth token here"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# Create the Saved Search object
saved_search = Evernote::EDAM::Type::SavedSearch.new
# Set the name of the saved search
saved_search.name = "test_search_name"

# Set the saved search query.  See Search Grammer for more info

saved_search.query = "any: -intitle:coffee -notebook:Private -tag:hate resource:* todo:false created:day-2"

# Create a SearchScope object
scope = Evernote::EDAM::Type::SavedSearchScope.new
# Set the scope for personal, shared and business notebooks
scope.includeAccount = true
scope.includePersonalLinkedNotebooks = true
scope.includeBusinessLinkedNotebooks = true
# Attach the scope object to the SavedSearch object
saved_search.scope = scope

# Returns a the saved search object as created by the Evernote service
# properties such as "guid", etc. will be filled in by the service.
saved_search = note_store.createSearch(access_token, saved_search)


