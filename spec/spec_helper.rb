require 'evernote-thrift'

module Helpers
  # Get access to next instance of Net::HTTP before comes out of Net::HTTP.new.
  def stub_next_http(host, port)
    # Lifted from HTTParty
    http = Net::HTTP.new(host, port, nil, nil)
    response = stub(Net::HTTPResponse, :[] => '', :body => '', :to_hash => {})
    http.stub(:post).and_return(response)
    Net::HTTP.should_receive(:new).with(host, port, nil, nil).and_return(http)

    http
  end
end

RSpec.configure do |config|
  # include Helper methods so every rspec example can use them
  config.include Helpers
end