require 'graphql'
require_relative '../graphql/types/emulator_type'
require_relative '../graphql/types/system_type'
require_relative '../graphql/types/game_type'
require_relative '../graphql/resolvers/emulator_resolver'
require_relative '../graphql/resolvers/system_resolver'
require_relative '../graphql/resolvers/game_resolver'
require_relative '../graphql/types/query_type'
require_relative '../graphql/mutations/mutation_type'
require_relative '../graphql/resolvers/emulator_mutation_resolver'

class EmulatorWarehouseSchema < GraphQL::Schema
  query QueryType
  mutation MutationType
end