class SystemType < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, String, null: false
  field :emulators, "[EmulatorType]", null: false
  field :games, "[GameType]", null: false, method: :games


  def emulators
    system_id = object[:id]
    emulator_ids = DB.execute("SELECT emulator_id FROM emulators_systems WHERE system_id = ?", system_id)
    emulator_ids.map do |row|
      emulator_id = row[0]

      EmulatorResolver.find_by_id(emulator_id)
    end
  end
  #TODO: Implement games resolver
  def games
    # Fetch games available for this system
    GameResolver.find_by_system_id(object[:id])
  end
end