#
# A simple Evernote API demo application that authenticates with the
# Evernote web service, lists all notebooks in the user's account,
# and creates a simple test note in the default notebook.
#
# Before running this sample, you must change the API consumer key
# and consumer secret to the values that you received from Evernote.
#
# To run (Unix):
#   ruby EDAMTest.rb myuser mypass
#

require "digest/md5"

# Add the Thrift & Evernote Ruby libraries to the load path.
# This will only work if you run this application from the ruby/sample/client
# directory of the Evernote API SDK.
dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.push("#{dir}/../../lib")
$LOAD_PATH.push("#{dir}/../../lib/Evernote/EDAM")

require "thrift/types"
require "thrift/struct"
require "thrift/protocol/base_protocol"
require "thrift/protocol/binary_protocol"
require "thrift/transport/base_transport"
require "thrift/transport/http_client_transport"
require "Evernote/EDAM/user_store"
require "Evernote/EDAM/user_store_constants.rb"
require "Evernote/EDAM/note_store"
require "Evernote/EDAM/limits_constants.rb"


# NOTE: Provide the consumer key and consumer secret that you received from Evernote
consumerKey = ""
consumerSecret = ""

if (consumerKey.empty? || consumerSecret.empty?)
  puts "Please set your API consumer key and secret"
  puts "To get an API key, visit http://dev.evernote.com/documentation/cloud/"
  exit(1)
end
if (ARGV.size < 2)
  puts "Arguments:  <username> <password>"
  exit(1)
end

username = ARGV[0]
password = ARGV[1]

evernoteHost = "sandbox.evernote.com"
userStoreUrl = "https://#{evernoteHost}/edam/user"

userStoreTransport = Thrift::HTTPClientTransport.new(userStoreUrl)
userStoreProtocol = Thrift::BinaryProtocol.new(userStoreTransport)
userStore = Evernote::EDAM::UserStore::UserStore::Client.new(userStoreProtocol)

versionOK = userStore.checkVersion("Ruby EDAMTest",
                                Evernote::EDAM::UserStore::EDAM_VERSION_MAJOR,
                                Evernote::EDAM::UserStore::EDAM_VERSION_MINOR)
puts "Is my EDAM protocol version up to date?  #{versionOK}"
if (!versionOK)
  exit(1)
end

# Authenticate the user
begin
  authResult = userStore.authenticate(username, password,
                                      consumerKey, consumerSecret)
rescue Evernote::EDAM::Error::EDAMUserException => ex
  # See http://www.evernote.com/about/developer/api/ref/UserStore.html#Fn_UserStore_authenticate
  parameter = ex.parameter
  errorCode = ex.errorCode
  errorText = Evernote::EDAM::Error::EDAMErrorCode::VALUE_MAP[errorCode]

  puts "Authentication failed (parameter: #{parameter} errorCode: #{errorText})"

  if (errorCode == Evernote::EDAM::Error::EDAMErrorCode::INVALID_AUTH)
    if (parameter == "consumerKey")
      puts "Your consumer key was not accepted by #{evernoteHost}"
      puts "This sample client application requires a client API key."
      puts "If you requested an OAuth key, you must authenticate using OAuth as shown in sample/oauth"
      puts "If you do not have an API Key from Evernote, you can request one from http://dev.evernote.com/documentation/cloud/"
    elsif (parameter == "username")
      puts "You must authenticate using a username and password from #{evernoteHost}"
      if (evernoteHost != "www.evernote.com")
        puts "Note that your production Evernote account will not work on #{evernoteHost},"
        puts "you must register for a separate test account at https://#{evernoteHost}/Registration.action"
      end
    elsif (parameter == "password")
      puts "The password that you entered is incorrect"
    end
  end

  exit(1)
end

user = authResult.user
authToken = authResult.authenticationToken
puts "Authentication was successful for #{user.username}"
puts "Authentication token = #{authToken}"

noteStoreTransport = Thrift::HTTPClientTransport.new(authResult.noteStoreUrl)
noteStoreProtocol = Thrift::BinaryProtocol.new(noteStoreTransport)
noteStore = Evernote::EDAM::NoteStore::NoteStore::Client.new(noteStoreProtocol)

notebooks = noteStore.listNotebooks(authToken)
puts "Found #{notebooks.size} notebooks:"
defaultNotebook = notebooks[0]
notebooks.each { |notebook| 
  puts "  * #{notebook.name}"
  if (notebook.defaultNotebook)
    defaultNotebook = notebook
  end
}

puts
puts "Creating a new note in the default notebook: #{defaultNotebook.name}"
puts

filename = "enlogo.png"
image = File.open(filename, "rb") { |io| io.read }
hashFunc = Digest::MD5.new
hashHex = hashFunc.hexdigest(image)

data = Evernote::EDAM::Type::Data.new()
data.size = image.size
data.bodyHash = hashHex
data.body = image

resource = Evernote::EDAM::Type::Resource.new()
resource.mime = "image/png"
resource.data = data
resource.attributes = Evernote::EDAM::Type::ResourceAttributes.new()
resource.attributes.fileName = filename

note = Evernote::EDAM::Type::Note.new()
note.title = "Test note from ENTest.rb"
note.content = '<?xml version="1.0" encoding="UTF-8"?>' +
  '<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">' +
  '<en-note>Here is the Evernote logo:<br/>' +
  '<en-media type="image/png" hash="' + hashHex + '"/>' +
  '</en-note>'
note.resources = [ resource ]

createdNote = noteStore.createNote(authToken, note)

puts "Successfully created a new note with GUID: #{createdNote.guid}"
