# Import the Evernote client
require 'evernote_oauth' 
# Import time class
require 'time'

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your dev or oauth token"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# GUID of the note to retrive the previous versions of
note_guid= "insert your note guid"

# USN of a previous update to the note from when you would like to retirve the note
# for a list of previous USNs see the method "listNoteVersions"
# this method is only avalible to call on account that have Evernote Premium (premium-only feature)
usn = 2522

# Boolean values to include various portions of resource data and metadata:
include_resources = false
include_resoruce_recognition = false
include_alternate_data = false

# Returns a list of tag name that are attached to the note
versioned_note = note_store.getNoteVersion(access_token, note_guid, usn, include_resources, include_resoruce_recognition, include_alternate_data)	

puts "The pervious version of the note titled #{versioned_note.title} has been retrived.  This version of the note was last updated on #{Time.at(versioned_note.updated/1000)}"
