# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your dev or oauth token here"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# Note GUID of the note that has the resource to retrive"
note_guid= "insert your note guid"

# The hex ended string of the MD5 Hash of the binary content that you wish to retrive
# This value is usally present in the ENML where the resource appears in the
# note in the element "en-media" under the attribute "hash"
content_hash = "insert contetent hash"

# Set various Boolean values defining what data and metadata to retrive:
# If true, the Resource will include the binary contents of the 'data' field's body.
with_data = false
# If true, the Resource will include the binary contents of the 'recognition' field's body if recognition data is present.
with_recognition = false
# If true, the Resource will include the binary contents of the 'alternateData' field's body, if an alternate form is present.
with_alternate_data = false

# Returns a string containing the alternate data
# if "EDAMNotFoundException Resource.alternateData" is throw the resource has no recognition

resource = note_store.getResourceByHash(access_token, note_guid, content_hash, with_data, with_recognition, with_alternate_data)
puts  "This resource with the GUID #{resource.guid} has the MIME type #{resource.mime}'." 
