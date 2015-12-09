# Import the Evernote client
require 'evernote_oauth' 

# For timestamp handeling 
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
note_guid= "70f0ff07-dace-4649-a1c6-fd9fff54360e"

# Get the most recent version of the note to prevent note conflicts
# for more information see getNoteWithResultSpec
result_spec = Evernote::EDAM::NoteStore::NoteResultSpec.new
result_spec.includeContent = false 
result_spec.includeResourcesData = false 
result_spec.includeResourcesRecognition = false
result_spec.includeResourcesAlternateData = false
result_spec.includeSharedNotes = false
note = note_store.getNoteWithResultSpec(access_token, note_guid, result_spec)

# Make the desired changes to the note object
# Check the USN of the note:
print "The current USN of the ntoe is #{note.updateSequenceNum}" 
# Update the title of the note
note.title = "the note title is now updated"
# Update the content of the note
note.content = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
note.content += "<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">"
note.content += "<en-note>This note was updated using Evernote's Ruby SDK!</en-note>"
# Update the update timestamp of the note
# Evernote uses UNIX timestamps in miliseconds
note.updated = Time.now.to_i
# You can also change tags, resources, what notebook the note is in (change the notebookGuid attribute)
# and any other property of the note object

# Submit a set of changes to a note to the service. 
# Perform the same operation as updateNote() would provided that the update sequence number on the 
# parameter Note object matches the current update sequence number that the service has for the note. 
# If they do not match, then no update is performed and the return value will have the current server state
# in the note field and updated will be false. If the update sequence numbers between the client and server 
# do match, then the note will be updated and the note field of the return value will be returned as it 
# would be for the updateNote method. 
print "attempting to update the note..."
update_result = note_store.updateNoteIfUsnMatches(access_token , note)

if update_result.updated then
	note = update_result.note
	print "The note with the title '#{note.title}' has been updated (USN #{note.updateSequenceNum})." 
else
	print "Note was not updated, please check to make sure you have an up to date version of the note."
end
