# Load libraries required by the Evernote OAuth sample applications
require 'oauth'
require 'oauth/consumer'

# Load Thrift & Evernote Ruby libraries
require "evernote-thrift"

# Client credentials
# Fill these in with the consumer key and consumer secret that you obtained
# from Evernote. If you do not have an Evernote API key, you may request one
# from http://dev.evernote.com/documentation/cloud/
OAUTH_CONSUMER_KEY = ""
OAUTH_CONSUMER_SECRET = ""

# Constants
# Replace this with https://www.evernote.com to use the Evernote production service
EVERNOTE_SERVER = "https://sandbox.evernote.com"
REQUEST_TOKEN_URL = "#{EVERNOTE_SERVER}/oauth"
ACCESS_TOKEN_URL = "#{EVERNOTE_SERVER}/oauth"
AUTHORIZATION_URL = "#{EVERNOTE_SERVER}/OAuth.action"
NOTESTORE_URL_BASE = "#{EVERNOTE_SERVER}/edam/note/"
