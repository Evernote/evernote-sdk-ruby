# Import the Evernote client
require 'evernote_oauth' 

# Define access token either:
# Developer Tokens (https://dev.evernote.com/doc/articles/dev_tokens.php)
# or OAuth (https://dev.evernote.com/doc/articles/authentication.php)"
access_token = "insert your access token"

# Setup the client
client = EvernoteOAuth::Client.new(token:access_token, sandbox:true)

# Get user store object
user_store = client.user_store

#simple function to give human readable byte sizes
def sizeof_fmt(num, suffix='B')
    ['','Ki','Mi','Gi','Ti','Pi','Ei','Zi'].each do |unit|
        if num.abs < 1024.0 then
            printf( "%3.1f%s%s" , num, unit, suffix)
        	num /= 1024.0
    	end
    end
    printf("%.1f%s%s",num,'Yi',suffix)  
end

# Get Account Limits for each service level
basic_account_limits = user_store.getAccountLimits(Evernote::EDAM::Type::ServiceLevel::BASIC)
plus_account_limits = user_store.getAccountLimits(Evernote::EDAM::Type::ServiceLevel::PLUS)
premium_account_limits = user_store.getAccountLimits(Evernote::EDAM::Type::ServiceLevel::PREMIUM)

puts "The upload limit for an Evernote Basic account is #{sizeof_fmt(basic_account_limits.uploadLimit)}"  
puts "The upload limit for an Evernote Plus account is #{sizeof_fmt(plus_account_limits.uploadLimit)}" 
puts "The upload limit for an Evernote Premium account is #{sizeof_fmt(premium_account_limits.uploadLimit)}" 