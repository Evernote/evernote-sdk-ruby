# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your dev or oauth access token"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# The GUID of the note to be shared
note_guid= "insert your guid"

# Returns a share key to join to the note via the API to other users
# (see authenticateToSharedNote)
# and/or to create a public link to the note

share_note_key = note_store.shareNote(access_token, note_guid)

# Create a public web link to the note 
# https://dev.evernote.com/doc/articles/note_links.php

#Get the User Store
user_store = client.user_store

# Get the webApiUrlPrefix
user_urls = user_store.getUserUrls
web_prefix = user_urls.webApiUrlPrefix

public_link = web_prefix + "/sh/" + note_guid + "/" + share_note_key

puts "You have sucsessfully shared a note from Evernote!"
puts "The public link for the note is:\n\n    #{public_link}\n" 
