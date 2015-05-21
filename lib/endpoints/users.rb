module Endpoints
  class Users < Base
    namespace "/users" do
      before do
        content_type :json, charset: 'utf-8'
      end

      get do
        users = Mediators::Users::FindAll.new.call
        ser = Serializers::User.new(:default)
        encode ser.serialize(users)
      end

      post do
        user = Mediators::Users::Creator.new(JSON.parse(request.body.read)).call
        status 201

        ser = Serializers::User.new(:default)
        encode ser.serialize(user)
      end

      get "/:id" do
        user = Mediators::Users::Finder.new(id: params[:id]).call
        ser = Serializers::User.new(:default)
        encode ser.serialize(user)
      end

      patch "/:id" do
        user = Mediators::Users::Updator.new(params[:id],JSON.parse(request.body.read)).call
        ser = Serializers::User.new(:default)
        encode ser.serialize(user)
      end

      delete "/:id" do
        user = Mediators::Users::Deletor.new(id: params[:id]).call
        ser = Serializers::User.new(:default)
        encode ser.serialize(user)
      end
    end
  end
end
