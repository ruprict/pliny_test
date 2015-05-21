require "spec_helper"

describe Endpoints::Users do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  let(:user) do
    User.create(
      first_name: 'Fred',
      last_name: 'Flinstone',
      email: 'ff@brisp.com'
    )
  end

  describe 'GET /users' do
    it 'returns correct status code and conforms to schema' do
      get '/users'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /users' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/users', MultiJson.encode({
        first_name: "Fred", 
        last_name: "Fred",
        email: "ff@brisp.com"
      })
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /users/:id' do

    it 'returns correct status code and conforms to schema' do
      get "/users/#{user.id}"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /users/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch "/users/#{user.id}", MultiJson.encode(
        first_name: 'Pebbles'
      )
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /users/:id' do
    it 'returns correct status code and conforms to schema' do
      delete "/users/#{user.id}"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end
