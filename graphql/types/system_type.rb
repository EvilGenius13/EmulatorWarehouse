require 'graphql'

class SystemType < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, String, null: false
end