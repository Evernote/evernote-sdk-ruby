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

# Set maximum entries for the sync chunck to return
max_entries = 100

# Set the USN of the update you want to get data after
# i.e. if you app has data since USN 1111 enter USN 1111 to get updates
# for content updated/created after USN 1111
after_USN =0

# Create sync chunk filter object
sync_filter = Evernote::EDAM::NoteStore::SyncChunkFilter.new
# Set boolean attributes of the sync filter:
sync_filter.includeNotes = true
sync_filter.includeNoteResources = false
sync_filter.includeNoteAttributes = true
sync_filter.includeNotebooks = true
# sync_filter.includeTags = false
# sync_filter.includeSearches = false
# sync_filter.includeResources = false
# sync_filter.includeLinkedNotebooks = true
# #sync_filter.includeExpunged = false
# sync_filter.includeNoteApplicationDataFullMap = true
# sync_filter.includeResourceApplicationDataFullMap = true
# sync_filter.includeNoteResourceApplicationDataFullMap = true
# sync_filter.includedSharedNotes = true
# sync_filter.omitSharedNotebooks = false
#sync_filter.requireNoteContentClass	= 'evernote.contact.1'
#sync_filter.notebookGuids = ["aafdb794-7207-4fa5-8d69-fdb3a87f031d"]#["Notebook GUID 1", "Notebook GUID 2", "Notebook GUID 3", "..."]

# Returns a notebook object that is the user's default notebook
# as created by the Evernote service
sync_chunk = note_store.getFilteredSyncChunk(access_token, after_USN, max_entries, sync_filter)


if sync_chunk.notes == nil and  sync_chunk.notebooks = nil and  sync_chunk.tags == nil  then
	puts "No sync chunk recived."
else 
	puts "Recivied sync chunk:"	
end
if sync_chunk.notes then
	puts "    * #{sync_chunk.notes.length} note(s)" 
end

if sync_chunk.notebooks then
	puts "    * #{sync_chunk.notebooks.length} notebook(s)" 
end

if sync_chunk.tags then
	puts "    * #{sync_chunk.tags.length} tag(s)" 
end