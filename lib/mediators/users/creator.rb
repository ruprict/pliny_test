module Mediators::Users
  class Creator < Mediators::Base
    def initialize(args)
      @attributes = args 
    end

    def call
      User.create(@attributes)
    end
  end
end
