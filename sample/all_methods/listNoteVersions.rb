# Import the Evernote client
require 'evernote_oauth' 

# for time handling
require 'time'

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert dev or oauth token here"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# GUID of the note to retrive the previous version ids of
note_guid= "insert note GUID to retirve versions here"

# Returns a list of previous version for the note inclding title, dates updated and USN
# Use the USN in conjuntion with getNoteVersion to retrive a pervious version of the note
# this method is only avalible to call on account that have Evernote Premium (premium-only feature)
previous_note_ids = note_store.listNoteVersions(access_token, note_guid)


print "There are #{previous_note_ids.length} previous note versions with USNs of:" 
previous_note_ids.each do |note_id|
	puts "   * #{note_id.updateSequenceNum} updated on #{Time.at(note_id.updated/1000)}" 
end
