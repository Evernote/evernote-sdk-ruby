##
# evernote_oauth_simple.rb
# Copyright 2010 Evernote Corporation. All rights reserved.
#
# This sample web application demonstrates the process of using OAuth to 
# authenticate to the Evernote web service. More information can be found in the 
# Evernote API Overview at http://www.evernote.com/about/developer/api/evernote-api.htm.
#
# Note that we're not attempting to demonstrate Ruby/Sinatra best practices or 
# build a scalable multi-user web application, we're simply giving you an idea
# of how the OAuth workflow works with Evernote.
#
# Note that the formalization of OAuth as RFC 5849 introduced some terminology changes.
# The comments in this sample code use the new (RFC) terminology, but most of the code
# itself still uses the old terms, which are also used by the OAuth RubyGem.
#
# Old term                    New Term
# --------------------------------------------------
# Consumer                    client
# Service Provider            server
# User                        resource owner
# Consumer Key and Secret     client credentials
# Request Token and Secret    temporary credentials
# Access Token and Secret     token credentials
#
# Requires the Sinatra framework and the OAuth RubyGem. You can install these
# components as follows:
#
#   gem install sinatra
#   gem install oauth
#
# To run this application:
#
#   ruby -rubygems evernote_oauth_simple.rb
#
# Sinatra will start on port 4567. You can view the sample application by visiting
# http://localhost:4567 in a browser.
##

require 'sinatra'
enable :sessions

# Load our dependencies and configuration settings
$LOAD_PATH.push(File.expand_path(File.dirname(__FILE__)))
require "evernote_config.rb"

##
# Verify that you have obtained an Evernote API key
##
before do
  if (OAUTH_CONSUMER_KEY.empty? || OAUTH_CONSUMER_SECRET.empty?) 
    halt '<span style="color:red">Before using this sample code you must edit evernote_config.rb and replace OAUTH_CONSUMER_KEY and OAUTH_CONSUMER_SECRET with the values that you received from Evernote. If you do not have an API key, you can request one from <a href="http://dev.evernote.com/documentation/cloud/">dev.evernote.com/documentation/cloud/</a>.</span>'
  end
end

##
# Index page
##
get '/' do
  erb :authorize
end

##
# Reset the session
##
get '/reset' do
  session[:request_token] = nil
  erb :authorize
end

##
# Get temporary credentials and redirect the user to Evernote for authoriation
##
get '/authorize' do
  callback_url = request.url.chomp("authorize").concat("callback")

  begin
    consumer = OAuth::Consumer.new(OAUTH_CONSUMER_KEY, OAUTH_CONSUMER_SECRET,{
        :site => EVERNOTE_SERVER,
        :request_token_path => "/oauth",
        :access_token_path => "/oauth",
        :authorize_path => "/OAuth.action"})
    session[:request_token] = consumer.get_request_token(:oauth_callback => callback_url)
    redirect session[:request_token].authorize_url
  rescue Exception => e
    @last_error = "Error obtaining temporary credentials: #{e.message}"
    erb :error
  end
end

##
# Receive callback from the Evernote authorization page and exchange the
# temporary credentials for an token credentials.
##
get '/callback' do
  if (params['oauth_verifier'].nil?)
    @last_error = "Content owner did not authorize the temporary credentials"
    erb :error
  else
    oauth_verifier = params['oauth_verifier']

    begin
      access_token = session[:request_token].get_access_token(:oauth_verifier => oauth_verifier)

      noteStoreTransport = Thrift::HTTPClientTransport.new(access_token.params['edam_noteStoreUrl'])
      noteStoreProtocol = Thrift::BinaryProtocol.new(noteStoreTransport)
      noteStore = Evernote::EDAM::NoteStore::NoteStore::Client.new(noteStoreProtocol)

      # Build an array of notebook names from the array of Notebook objects
      notebooks = noteStore.listNotebooks(access_token.token)
      result = Array.new
      notebooks.each do |notebook| 
        result << notebook.name
      end
      @notebooks = result
      erb :complete
    rescue Exception => e
      @last_error = e.message
      erb :error
    end
  end
end


__END__


@@ layout
<html>
  <head>
    <title>Evernote Ruby OAuth Demo</title>
  </head>
  <body>
    <h1>Evernote Ruby OAuth Demo</h1>

    <p>
      This application uses the <a href="http://www.sinatrarb.com/">Sinatra framework</a> to demonstrate the use of OAuth to authenticate to the Evernote web service. OAuth support is implemented using the <a href="https://github.com/oauth/oauth-ruby">Ruby OAuth RubyGem</a>.
    </p>

    <p>
      On this page, we demonstrate how OAuth authentication might work in the real world.
      To see a step-by-step demonstration of how OAuth works, see <code>evernote_oauth.rb</code>.
    </p>

    <hr/>

    <h2>Evernote Authentication</h2>

    <%= yield %>

    <hr/>
    
    <p>
      <a href="/reset">Click here</a> to start over
    </p>

  </body>
</html>


@@ error
    <p>
      <span style="color:red">An error occurred: <%= @last_error %></span>
    </p>

@@ authorize
    <p>
      <a href="/authorize">Click here</a> to authorize this application to access your Evernote account. You will be directed to evernote.com to authorize access, then returned to this application after authorization is complete.
    </p>


@@ complete
    <p style="color:green">
      Congratulations, you have successfully authorized this application to access your Evernote account!
    </p>

    <p>
      You account contains the following notebooks:
    </p>

    <ul>
<% @notebooks.each do |notebook| %>
      <li><%= notebook %></li>
<% end %>
    </ul>

