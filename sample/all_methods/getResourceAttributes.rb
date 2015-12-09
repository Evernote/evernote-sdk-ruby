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


# insert resource GUID to resource to retrive the alternate data of here"
resource_guid = "insert resource GUID here" 

# Returns a string containing the alternate data
# if "EDAMNotFoundException Resource.alternateData" is throw the resource has no recognition
resource_attributes = note_store.getResourceAttributes(access_token , resource_guid)

print "This resource has the file name #{resource_attributes.fileName}, and a recognition data type of #{resource_attributes.recoType}."