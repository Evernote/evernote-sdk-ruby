# Import the Evernote client
require 'evernote_oauth' 

#for time handling
require 'time'


# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert dev or oauth token here"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get note store object
note_store = client.note_store

# Returns a sync state object that contains information on the sync state of the account
# including the USN, the monotomically increseaing integer to indicate when updates have
# occured as indicated by the Evernote service
sync_state = note_store.getSyncState

puts "The USN at #{Time.at(sync_state.currentTime/1000)} is #{sync_state.updateCount}." 