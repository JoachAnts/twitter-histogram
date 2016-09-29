require_relative './app'
require 'test/unit'
require 'rack/test'
require 'json'

set :environment, :test

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  def test_histogram_potus_returns_histogram
  	get '/histogram/POTUS'
  	assert last_response.ok?
  	histogram = JSON.parse last_response.body
  	(0..23).each do |num| assert histogram.has_key?(num.to_s) end
  end
  
  def test_hello_joe_returns_hello
  	name = "joe"
  	get "/hello/#{name}"
    assert last_response.ok?
    assert_equal "Hello #{name}", last_response.body
  end

  def test_root_returns_hint
    get '/'
    assert last_response.ok?
    assert_equal 'Try /hello/:name', last_response.body
  end
  
  def test_histogram_returns_hint
  	get '/histogram'
    assert last_response.ok?
    assert_equal 'Try /hello/:name', last_response.body
  end
  
  def test_hello_returns_hint
    get '/hello'
    assert last_response.ok?
    assert_equal 'Try /hello/:name', last_response.body
  end
  
  def test_hi_returns_hint
    get '/hi'
    assert last_response.ok?
    assert_equal 'Try /hello/:name', last_response.body
  end
  
  def test_hi_name_returns_hint
    get '/hi/joe'
    assert last_response.ok?
    assert_equal 'Try /hello/:name', last_response.body
  end
end
