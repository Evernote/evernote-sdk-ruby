# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'evernote-thrift'

majorv = Evernote::EDAM::UserStore::EDAM_VERSION_MAJOR
minorv = Evernote::EDAM::UserStore::EDAM_VERSION_MINOR
rev = 1
version = Gem::Version.new("#{majorv}.#{minorv}.#{rev}").version

Gem::Specification.new do |s|
  s.name = %q{evernote-thrift}
  s.version = version

  s.authors = ["Evernote"]
  s.date = Time.now.strftime('%Y-%m-%d')
  s.description = %q{This SDK contains wrapper code used to call the Evernote Cloud API from Ruby.}
  s.email = %q{api@evernote.com}
  s.files = ["LICENSE", "NOTICE", "README.md", "APACHE-LICENSE-2.0.txt", "evernote-thrift.gemspec"] + Dir.glob('{lib}/**/*')
  s.has_rdoc = false
  s.homepage = %q{http://github.com/evernote/evernote-sdk-ruby}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{evernote-sdk-ruby}
  s.rubygems_version = version
  s.summary = %q{This SDK contains wrapper code used to call the Evernote Cloud API from Ruby.}

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'fakeweb', '~> 1.3.0'
end
