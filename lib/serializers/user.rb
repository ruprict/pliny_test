class Serializers::User < Serializers::Base
  structure(:default) do |user|
    {
      first_name:   user.first_name,
      last_name:    user.last_name,
      email:        user.email,
      created_at:   user.created_at.try(:iso8601),
      id:           user.id,
      updated_at:   user.updated_at.try(:iso8601),
    }
  end
end
