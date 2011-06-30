require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'challonge-api'

# Setup challonge-api stuff.
Challonge::API.username = 'challonge_api_tests'
Challonge::API.key = 't6rj4hpucgjj5h2zg2nefckaj3urxiizisrbdwxe'

class Test::Unit::TestCase
end
