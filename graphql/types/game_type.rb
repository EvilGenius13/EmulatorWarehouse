class GameType < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, String, null: false
  field :release_date, GraphQL::Types::ISO8601Date, null: false
  field :system, "SystemType", null: false, method: :system
  field :emulators, "[EmulatorType]", null: false, method: :emulators

  #TODO: Implement system resolver
  def system
    SystemResolver.find_by_id(object[:system_id])
  end

  #TODO: Implement emulators resolver
  def emulators
    game_id = object[:id]
    emulator_ids = DB.execute("SELECT emulator_id FROM emulators_games WHERE game_id = ?", game_id)
    emulator_ids.map do |row|
      emulator_id = row[0]

      EmulatorResolver.find_by_id(emulator_id)
    end
  end
end