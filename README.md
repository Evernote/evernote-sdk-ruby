Evernote SDK for Ruby
=====================
Evernote API version 1.21

Overview
--------
This SDK contains wrapper code used to call the Evernote Cloud API from Ruby.

The SDK also contains two samples. The code in sample/client demonstrates the basic use of the SDK for single-user scripts. The code in sample/oauth demonstrates the basic use of the SDK for web applications that authenticate using OAuth.

Prerequisites
-------------
In order to use the code in this SDK, you need to obtain an API key from http://dev.evernote.com/documentation/cloud. You'll also find full API documentation on that page.

In order to run the sample code, you need a user account on the sandbox service where you will do your development. Sign up for an account at https://sandbox.evernote.com/Registration.action 

In order to run the client client sample code, you need a developer token. Get one at https://sandbox.evernote.com/api/DeveloperToken.action

Getting Started - Client
------------------------
The code in sample/client/EDAMTest.rb demonstrates the basics of using the Evernote API, using developer tokens to simplify the authentication process while you're learning. 

1. Open sample/client/EDAMTest.rb
2. Scroll down and fill in your Evernote developer token.
3. On the command line, run the following command to execute the script: 

    ruby EDAMTest.rb

Getting Started - OAuth
-----------------------
Web applications must use OAuth to authenticate to the Evernote service. The code in sample/oauth contains 2 simple web apps that demonstrate the OAuth authentication process. The applications use the [Sinatra framework](http://www.sinatrarb.com/). You don't need to use Sinatra for your application, but you'll need it to run the sample code. The applications also use the [OAuth RubyGem](http://rubygems.org/gems/oauth) to provide the underlying OAuth functionality.

There are two pages in the sample. evernote_oauth.rb demonstrates each step of the OAuth process in detail. This is useful for developers, but not what an end user would see. evernote_oauth_simple demonstrates the simplified process, which is similar to what you would implement in your production app.

1. Install Sinatra: gem install sinatra
2. Install OAuth: gem install oauth
3. Open the file sample/oauth/evernote_config.rb
4. Fill in your Evernote API consumer key and secret.
5. On the command line, run the following command to start the datailed sample app:

    ruby -rubygems evernote_oauth.rb
6. Open the sample app in your browser: http://localhost:4567
7. Repeat steps 5 and 6 with the file evernote_oauth_simple.rb to run the simple sample app.
