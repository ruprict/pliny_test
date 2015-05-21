module Mediators::Users
  class FindAll < Mediators::Base
    def initialize(args = {})
      @args = args
    end

    def call
      User.find_all 
    end
  end
end
