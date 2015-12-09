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

# GUID of the note to attach the application data to
resource_guid = "insert resource GUID to attach key-value storage to here"

#Returns a lazy map of all the application data associated with the note
application_data = note_store.getResourceApplicationData(access_token , resource_guid)

print "Note has #{application_data.fullMap.length} application data entries:"
application_data.fullMap.each do |key , value| 
	puts "   * #{key}: #{value}"
end
