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

# GUID of the note selected
selected_note_guid = "insert GUID of note to get offset in search results"

# Create note filter object
note_filter = Evernote::EDAM::NoteStore::NoteFilter.new

# Set note filter search grammer to get notes created in the last 2 days
note_filter.words = "updated:month-2"

# Uncommend the following line to set note filter tag GUIDs
#note_filter.tagGuids = ["GUID of tag1", "GUID of tag 2", "...."]

# Set note filter order to descending
note_filter.ascending = false

# Set note filter inative attribute to False (will search only active notes)
# setting this value to True will only return search results that are in the trash
note_filter.inactive = false

# Uncomment the following line to set note time zone of the search to 'America/Los_Angeles'
#note_filter.timeZone = "America/Los_Angeles"

# Uncomment the following line to set note filter emphasized attribute to additional 
# 'wish list' search grammer to be used in conjunction with the orinigal search query to 
# highlight search results 
#note_filter.emphasized = "any: tag:cool -tag:uncool"

# Uncomment the following line to set note filter includeAllReadableNotebooks attribute
# to include all readable business notebooks in a search
# search must be performed on a business note store with a business auth token
#note_filter.includeAllReadableNotebooks=True

# Returns an object which maps the number of notes captured by the filter to the corresponding
# notebook GUID
note_offset = note_store.findNoteOffset( access_token, note_filter, selected_note_guid )

puts  "The note offset is #{note_offset}" 