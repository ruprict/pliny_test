require "spec_helper"

describe User do

  it{ is_expected.to validate_presence :name, :allow_nil => true }
end
