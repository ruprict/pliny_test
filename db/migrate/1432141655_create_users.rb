Sequel.migration do
  change do
    create_table(:users) do
      uuid         :id, default: Sequel.function(:uuid_generate_v4), primary_key: true
      text         :first_name
      text         :last_name
      text         :email
      timestamptz  :created_at, default: Sequel.function(:now), null: false
      timestamptz  :updated_at
    end
  end
end
