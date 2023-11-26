require 'graphql'

class EmulatorType < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, String, null: false
  field :version, String, null: false
  field :release_date, GraphQL::Types::ISO8601Date, null: false
  field :download_link, String, null: false
end