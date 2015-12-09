require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert dev or oauth token here"


# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# insert resource GUID
resource_guid = "insert resource GUID here" 

# Returns a string with the binary data of the resource
resource_data = note_store.getResourceData(access_token, resource_guid)

# Write the data to a file
File.open(resource_guid,'w') do |file|
    file << resource_data
end

print "Resource data has been downloaded"