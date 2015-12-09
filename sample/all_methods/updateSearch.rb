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

# Insert saved search GUID to updated
saved_search_guid = "insert saved search guid"

# Get saved search object
# see getSearch for more info
saved_search = note_store.getSearch(access_token, saved_search_guid)

# Updated Saved search object
saved_search.name = "Important and recently Created Notes"
saved_search.query = 'any: tag:important created:day-6'

# Create a SearchScope object
scope = Evernote::EDAM::Type::SavedSearchScope.new
# Set the scope for personal, shared and business notebooks
scope.includeAccount = true
scope.includePersonalLinkedNotebooks = true
scope.includeBusinessLinkedNotebooks = true
# Attach the scope object to the SavedSearch object
saved_search.scope = scope

# Submits search changes to the service. The provided data must include the search's guid field for identification. 
# The service will apply updates to the following search fields: name, query, and scope.
usn = note_store.updateSearch(access_token, saved_search)

puts "The saved search named '#{saved_search.name}' has been updaed (USN #{usn})."