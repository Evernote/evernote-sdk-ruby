##
# evernote_oauth.rb
# Copyright 2010 Evernote Corporation. All rights reserved.
#
# This sample web application demonstrates the step-by-step process of using OAuth to 
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
#   ruby -rubygems evernote_oauth.rb
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
  erb :index
end

##
# Reset the session
##
get '/reset' do
  session[:request_token] = nil
  session[:access_token] = nil
  session[:oauth_verifier] = nil
  session[:noteStoreUrl] = nil
  session[:webApiUrlPrefix] = nil
  session[:tokenExpires] = nil
  session[:userId] = nil
  session[:notebooks] = nil
  erb :index
end

##
# Step 1: obtain temporary credentials
##
get '/requesttoken' do
  callback_url = request.url.chomp("requesttoken").concat("callback")

  begin
    consumer = OAuth::Consumer.new(OAUTH_CONSUMER_KEY, OAUTH_CONSUMER_SECRET,{
        :site => EVERNOTE_SERVER,
        :request_token_path => "/oauth",
        :access_token_path => "/oauth",
        :authorize_path => "/OAuth.action"})
    session[:request_token] = consumer.get_request_token(:oauth_callback => callback_url)
    @current_status = "Obtained temporary credentials"
  rescue Exception => e
    @last_error = "Error obtaining temporary credentials: #{e.message}"
  end
  erb :index
end

##
# Step 2a: redirect the user to Evernote for authoriation
##
get '/authorize' do
  if (session[:request_token].nil? == false)
    redirect session[:request_token].authorize_url
  else
    # You shouldn't be invoking this if you don't have a request token
    erb :index
  end
end

##
# Step 2b: receive callback from the Evernote authorization page
##
get '/callback' do
  if (params['oauth_verifier'].nil?)
    @last_error = "Content owner did not authorize the temporary credentials"
  else
    session[:oauth_verifier] = params['oauth_verifier']
    @current_status = "Content owner authorized the temporary credentials"
  end
  erb :index
end

##
# Step 3: exchange the temporary credentials for token credentials
##
get '/accesstoken' do
  # You shouldn't be invoking this if you don't have a request token
  if (session[:request_token].nil? == false)
    begin
      session[:access_token] = session[:request_token].get_access_token(:oauth_verifier => session[:oauth_verifier])
      
      # The response from the server will include the NoteStore URL that we
      # will use to access the user's notes, as well as some other handy variables
      session[:noteStoreUrl] = session[:access_token].params['edam_noteStoreUrl']
      session[:webApiUrlPrefix] = session[:access_token].params['edam_webApiUrlPrefix']
      session[:userId] = session[:access_token].params['edam_userId']

      # Convert from milliseconds since the the epoch to seconds with fractional part
      session[:tokenExpires] = session[:access_token].params['edam_expires']
      
      @current_status = "Exchanged the authorized temporary credentials for token credentials"
    rescue Exception => e
      @last_error = "Failed to obtain token credentials: #{e.message}"      
    end
  end
  erb :index
end

##
# Step 4: access the user's Evernote account
##
get '/list' do

  noteStoreTransport = Thrift::HTTPClientTransport.new(session[:noteStoreUrl])
  noteStoreProtocol = Thrift::BinaryProtocol.new(noteStoreTransport)
  noteStore = Evernote::EDAM::NoteStore::NoteStore::Client.new(noteStoreProtocol)
  
  begin
    # All NoteStore API calls require you to pass the OAuth token credentials 
    # (aka access token) as the auth token
    notebooks = noteStore.listNotebooks(session[:access_token].token)
    result = Array.new
    notebooks.each do |notebook| 
      result << notebook.name
    end
    session[:notebooks] = result
    @current_status = "Successfully listed content owner's notebooks"
  rescue Exception => e
    @last_error = "Error listing notebooks: #{e.message}"      
  end

  erb :index
end


__END__


@@ index
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
      On this page, we demonstrate each step of the OAuth authentication process. You would not typically expose a user to this level of detail. To use an application that is more similar to what you would see in the real world, see <code>evernote_oauth_simple.rb</code>.
    </p>

    <hr/>

    <h2>Authentication Steps</h2>

    <ul>
      <li>
        <b>Step 1</b>: 
<% if (session[:request_token].nil?) %> 
        <a href="/requesttoken">Click here</a> to 
<% end %> 
        obtain temporary credentials
      </li>
      
      <li>
        <b>Step 2</b>: 
<% if (session[:request_token].nil? == false and session[:oauth_verifier].nil?) %>         
        <a href="/authorize">Click here</a> to 
<% end %>
        authorize the temporary credentials
      </li>
      
      <li>
        <b>Step 3</b>:
<% if (session[:request_token].nil? == false and session[:oauth_verifier].nil? == false and session[:access_token].nil?) %>         
        <a href="/accesstoken">Click here</a> to
<% end %>
        exchange the authorized temporary credentials for token credentials
      </li>
      
      <li>
        <b>Step 4</b>: 
<% if (session[:access_token].nil? == false) %>         
        <a href="/list">Click here</a> to 
<% end %>
        list all notebooks in the authorizing user's Evernote account
      </li>
    </ul>
    
    <p>
      <a href="/reset">Click here</a> to start over
    </p>

    <hr/>
    
    <h2>Current status</h2>
    <p>
      <b>Evernote server:</b> <%= EVERNOTE_SERVER %><br />
      <b>NoteStore URL:</b> <%= session[:noteStoreUrl] %><br />
      <b>Web API URL prefix:</b> <%= session[:webApiUrlPrefix] %>
    </p>
    <p>
      <b>Last action:</b>
<% if (@last_error.nil? == false) %>
      <span style="color:red"><%= @last_error %></span>
<% elsif (@current_status.nil? == false) %>
      <span style="color:green"><%= @current_status %></span>
<% end %>
    </p>
    
<% if (session[:notebooks].nil? == false) %>
    <b>Notebooks:</b>
    <ul>
<% session[:notebooks].each do |notebook| %>
    <li><%= notebook %></li>
<% end %>
    </ul>
<% end %>
    
    <b>Temporary credentials:</b>
    <ul>
      <li><b>Identifier:</b><br/>
      <%= session[:request_token].token if session[:request_token].nil? == false %>
      <li><b>Secret:</b><br/>
      <%= session[:request_token].secret if session[:request_token].nil? == false %>
    </ul>

    <p>
      <b>OAuth verifier:</b><br/>
      <%= session[:oauth_verifier] if session[:oauth_verifier].nil? == false %>
    </p>

    <b>Token credentials:</b>
    <ul>
      <li><b>Identifier:</b><br/>
      <%= session[:access_token].token if session[:access_token].nil? == false %>
      <li><b>Secret:</b><br/>
      <%= session[:access_token].secret if session[:access_token].nil? == false %>
      <li><b>User ID:</b><br/>
      <%= session[:userId] if session[:userId].nil? == false %>
      <li><b>Expires:</b><br/>
      <%= Time.at(session[:tokenExpires].to_i / 1000) if session[:tokenExpires].nil? == false %>
    </ul>
  </body>
</html>
