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


# GUID of note to be updated
note_guid= "note guid"

# Get the most recent version of the note to prevent note conflicts
# for more information see getNoteWithResultSpec
=begin 
result_spec = Evernote::EDAM::Type::NoteResultSpec.new
result_spec.includeContent = false 
result_spec.includeResourcesData = false 
result_spec.includeResourcesRecognition = false
result_spec.includeResourcesAlternateData = false
result_spec.includeSharedNotes = false
note = note_store.getNoteWithResultSpec(access_token, note_guid, result_spec)
=end
note = Evernote::EDAM::Type::Note.new
# Make the desired changes to the note object
# Insert noteguid to the note 
note.guid = note_guid
# Update the title of the note
note.title = "the note title is now updated"
# Update the content of the note
note.content = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
note.content += "<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">"
note.content += "<en-note>This note was updated using Evernote's ruby SDK!</en-note>"
# Update the update timestamp of the note
# Evernote uses UNIX timestamps in miliseconds
time = Time.now.to_i
note.updated = time
# You can also change tags, resources, what notebook the note is in (change the notebookGuid attribute)
# and any other property of the note object

# Submit a set of changes to a note to the service. 
# The provided data must include the note's guid field and title must be set.
# Returns the updated note object
updatenote = note_store.updateNote(access_token, note)
puts "The note with the title '#{updatenote.title}' has been updated (USN #{updatenote.updateSequenceNum})."

