require 'graphql'
require_relative 'types/query_type'
# require_relative 'mutations/mutation_type'

class EmulatorWarehouseSchema < GraphQL::Schema
  query QueryType
  # mutation MutationType
end