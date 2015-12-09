# Import the Evernote client
require 'evernote_oauth' 
require "rexml/document"
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

# Returns the XML contents of the recognition index for the resource with the provided GUID
# If the caller asks about a resource that has no recognition data, this will throw EDAMNotFoundException
# For more information see https://dev.evernote.com/doc/articles/image_recognition.php
resource_recognition = note_store.getResourceRecognition(access_token, resource_guid)

parsed_xml = REXML::Document.new(resource_recognition)

puts "Resource recognition data for the resource with GUID #{resource_guid}: \n\n#{parsed_xml}\n\n" 