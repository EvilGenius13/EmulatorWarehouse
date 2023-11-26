require 'graphql'

class GameType < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, String, null: false
  field :release_date, GraphQL::Types::ISO8601Date, null: false
  field :system, SystemType, null: false, method: :system
end