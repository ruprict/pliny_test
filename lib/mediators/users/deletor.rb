module Mediators::Users
  class Deletor < Mediators::Base
    def initialize(args = {})
     @args = args 
    end

    def call
      User.find(id: @args[:id]).destroy
    end
  end
end
