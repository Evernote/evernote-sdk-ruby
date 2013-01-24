require 'spec_helper'
require 'fakeweb'
require 'net/http'

describe Thrift::HTTPClientTransport do
  before :each do
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:any, 'http://www.evernote.com', :body => '')
    FakeWeb.register_uri(:any, 'https://www.evernote.com', :body => '')
  end

  after :each do
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = true
  end

  it "should send content-type header by default" do
    trans = Thrift::HTTPClientTransport.new('http://www.evernote.com')
    trans.flush

    req = FakeWeb.last_request

    req.key?('content-type').should be_true
  end

  it "should send user-agent header by default" do
    trans = Thrift::HTTPClientTransport.new('http://www.evernote.com')
    trans.flush

    req = FakeWeb.last_request

    req.key?('user-agent').should be_true
  end

  it "should send user-supplied headers" do
    trans = Thrift::HTTPClientTransport.new('http://www.evernote.com')
    trans.add_headers('animal' => 'dog', 'age' => '10')
    trans.flush

    req = FakeWeb.last_request

    req['animal'].should eq('dog')
    req['age'].should eq('10')
  end

  it "should accumulate user-supplied headers" do
    trans = Thrift::HTTPClientTransport.new('http://www.evernote.com')
    trans.add_headers('animal' => 'dog')
    trans.add_headers('age' => '10')
    trans.flush

    req = FakeWeb.last_request

    req['animal'].should eq('dog')
    req['age'].should eq('10')
  end

  it "should use most recent value when user-supplied header is repeated" do
    trans = Thrift::HTTPClientTransport.new('http://www.evernote.com')
    trans.add_headers('name' => 'first')
    trans.add_headers('name' => 'last')
    trans.flush

    req = FakeWeb.last_request

    req['name'].should eq('last')
  end

  it "should not use ssl when url is http" do
    http = stub_next_http('www.evernote.com', 80)

    http.should_receive(:use_ssl=).with(false).at_most(:once)

    trans = Thrift::HTTPClientTransport.new('http://www.evernote.com')
    trans.flush
  end

  describe 'with https url' do
    it "should use ssl" do
      http = stub_next_http('www.evernote.com', 443)

      http.should_receive(:use_ssl=).with(true)

      trans = Thrift::HTTPClientTransport.new('https://www.evernote.com')
      trans.flush
    end

    it "should apply ssl attributes" do
      http = stub_next_http('www.evernote.com', 443)

      http.should_receive(:ca_file=).with('/path/to/ca_file')
      http.should_receive(:verify_depth=).with(2)

      trans = Thrift::HTTPClientTransport.new('https://www.evernote.com')
      trans.add_ssl_attributes({
        :ca_file => '/path/to/ca_file',
        :verify_depth => 2
      })
      trans.flush
    end

    it "should verify peer cert by default" do
      http = stub_next_http('www.evernote.com', 443)

      http.should_receive(:verify_mode=).with(OpenSSL::SSL::VERIFY_PEER)

      trans = Thrift::HTTPClientTransport.new('https://www.evernote.com')
      trans.flush
    end
  end
end