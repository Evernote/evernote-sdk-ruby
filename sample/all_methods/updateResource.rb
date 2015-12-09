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

# insert resource GUID to resource to retrive here"
resource_guid = 'enter the GUID of the resource to be retrived here'


# Get resource object to update
# see getResource for more info
resource = note_store.getResource(access_token, resource_guid, true, true, true, true)

# Make the desired changes to the resource object
# Update the file name of the resource
resource.attributes.fileName = "this is an updated filename"
# Forces the display of the resource as an attachment and not to be displayed inline
resource.attributes.attachment = true
# You can also alter the binary file data by updating the data object contained in the
# data attribute of the resource object.   If you do be sure to update the bodyHash and
# size attributes of the data attribute as well as the body in addition to updating the
# hash of the en-media element in the note's contents.

#Returns the usn (update service number) of the update
usn = note_store.updateResource(access_token,resource)

puts "Updated resource with the file name '#{resource.attributes.fileName}', MIME type #{resource.mime} and size of #{resource.data.size} bytes (USN #{usn})." 