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
# Contains some contributions under the Thrift Software License.
# Please see doc/old-thrift-license.txt in the Thrift distribution for
# details.

$:.unshift File.dirname(__FILE__)

require 'thrift/bytes'
require 'thrift/core_ext'
require 'thrift/exceptions'
require 'thrift/types'
require 'thrift/processor'
require 'thrift/client'
require 'thrift/struct'
require 'thrift/union'
require 'thrift/struct_union'

# serializer
require 'thrift/serializer/serializer'
require 'thrift/serializer/deserializer'

# protocol
require 'thrift/protocol/base_protocol'
require 'thrift/protocol/binary_protocol'
require 'thrift/protocol/binary_protocol_accelerated'
require 'thrift/protocol/compact_protocol'
require 'thrift/protocol/json_protocol'

# transport
require 'thrift/transport/base_transport'
require 'thrift/transport/base_server_transport'
require 'thrift/transport/socket'
require 'thrift/transport/server_socket'
require 'thrift/transport/unix_socket'
require 'thrift/transport/unix_server_socket'
require 'thrift/transport/buffered_transport'
require 'thrift/transport/framed_transport'
require 'thrift/transport/http_client_transport'
require 'thrift/transport/io_stream_transport'
require 'thrift/transport/memory_buffer_transport'

# user-agent for rubygem
module Thrift
  class HTTPClientTransport < BaseTransport
    private
    alias_method :original_default_headers, :default_headers
    def default_headers
      gem_version = Gem.loaded_specs['evernote-thrift'].version.to_s
      {'Content-Type' => 'application/x-thrift',
        'User-Agent' => "evernote-thrift gem / #{gem_version}; Ruby / #{RUBY_VERSION};"}
    rescue
      original_default_headers
    end
  end
end

