module Mediators::Users
  class Finder < Mediators::Base
    def initialize(args = {})
      @args = args 
    end

    def call
      User.find(id: @args[:id]) if @args[:id]
    end
  end
end
