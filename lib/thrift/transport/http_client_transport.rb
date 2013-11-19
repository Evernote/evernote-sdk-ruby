# encoding: ascii-8bit
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
#

require 'net/http'
require 'net/https'
require 'uri'
require 'stringio'

module Thrift
  class HTTPClientTransport < BaseTransport

    def initialize(url, proxy_addr = nil, proxy_port = nil)
      @url = URI url
      @headers = default_headers
      @ssl_attributes = default_ssl_attributes
      @outbuf = Bytes.empty_byte_buffer
      @proxy_addr = proxy_addr
      @proxy_port = proxy_port
    end

    def open?; true end
    def read(sz); @inbuf.read sz end
    def write(buf); @outbuf << Bytes.force_binary_encoding(buf) end

    def add_headers(headers)
      @headers = @headers.merge(headers)
    end

    # Add ssl attributes for underlying Net::HTTP instance.
    #
    # attributes - Hash of Symbols to values where keys correspond to ssl
    #              attributes of Net::HTTP like ca_file, verify_mode, etc.
    def add_ssl_attributes(attributes)
      @ssl_attributes = @ssl_attributes.merge(attributes)
    end

    def flush
      http = Net::HTTP.new @url.host, @url.port, @proxy_addr, @proxy_port
      apply_ssl_attributes(http) if @url.scheme == "https"

      resp = http.post(@url.request_uri, @outbuf, @headers)
      if 'application/x-thrift'.downcase != resp.content_type.downcase
        raise TransportException.new(TransportException::UNKNOWN, "Unexpected response content type: " + resp.content_type)
      end
      data = resp.body
      data = Bytes.force_binary_encoding(data)
      @inbuf = StringIO.new data
      @outbuf = Bytes.empty_byte_buffer
    end

    private

    def default_headers
      sdk_version = "#{Evernote::EDAM::UserStore::EDAM_VERSION_MAJOR}.#{Evernote::EDAM::UserStore::EDAM_VERSION_MINOR}" rescue 'NA'
      {'Content-Type' => 'application/x-thrift',
        'User-Agent' => "Evernote SDK Ruby / #{sdk_version}; Ruby / #{RUBY_VERSION};"}
    end

    def default_ssl_attributes
      {:use_ssl => true,
        :verify_mode => OpenSSL::SSL::VERIFY_PEER}
    end

    def apply_ssl_attributes(http)
      @ssl_attributes.each do |k, v|
        http.__send__("#{k}=", v)
      end
    end
  end
end
