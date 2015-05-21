class User < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers
end
