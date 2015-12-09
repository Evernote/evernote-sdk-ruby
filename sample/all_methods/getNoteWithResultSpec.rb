# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your access token"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# GUID of the note to retrive
note_guid = "insert note guid to be updated"

# Create a result spec object to define what data and
# metadata is to be retuned by the call to getNoteWithResultSpec
result_spec = Evernote::EDAM::NoteStore::NoteResultSpec.new
# retrive the content of the note
result_spec.includeContent = false 
# retrive the binary data of the resources attached to this note
result_spec.includeResourcesData = false 
# Include OCR data associated with the resources (if present)
result_spec.includeResourcesRecognition = false
# Include recouce alternate data 
result_spec.includeResourcesAlternateData = false
# Include data on how this note has been shared
result_spec.includeSharedNotes = false


# Returns a list of previous version for the note inclding title, dates updated and USN
# Use the USN in conjuntion with getNoteVersion to retrive a pervious version of the note
# this method is only avalible to call on account that have Evernote Premium (premium-only feature)
note = note_store.getNoteWithResultSpec(access_token, note_guid, result_spec)
puts "Retrived note with title of #{note.title}." 