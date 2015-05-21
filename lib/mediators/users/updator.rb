module Mediators::Users
  class Updator < Mediators::Base
    def initialize(id, args)
      @id = id
     @args = args 
    end

    def call
      User.find(id: @id).update(@args)
    end
  end
end
