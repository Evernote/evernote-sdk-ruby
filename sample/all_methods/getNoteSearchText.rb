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

# GUID of the note to retrive the search contents of
note_guid= "insert GUID here"

# If true, will only return text from the note contents
# If false will return text from the note and any attachment 
# recofnition sources (i.e. text from PDFs, OCRed images)
note_only = false

# If true, this will break the text into cleanly separated and sanitized tokens. 
# If false, this will return the more raw text extraction, with its original punctuation, capitalization, spacing, etc.
tokenized = false

# Returns plain text contents of the note with the provided GUID
note_search_text = note_store.getNoteSearchText(access_token, note_guid, note_only, tokenized)


print "Note search text of note with GUID #{note_guid}: \n\n#{note_search_text}\n\n" 