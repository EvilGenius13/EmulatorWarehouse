class EmulatorType < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, String, null: false
  field :version, String, null: false
  field :release_date, GraphQL::Types::ISO8601Date, null: false
  field :download_link, String, null: false
  field :systems, "[SystemType]", null: false
  field :games, "[GameType]", null: false, method: :games


  def systems
    emulator_id = object[:id]
    system_ids = DB.execute("SELECT system_id FROM emulators_systems WHERE emulator_id = ?", emulator_id)
    system_ids.map do |row|
      system_id = row[0]

      SystemResolver.find_by_id(system_id)
    end
  end

  def games
    # Fetch games that can be played on this emulator
    game_ids = DB.execute("SELECT game_id FROM games_emulators WHERE emulator_id = ?", object[:id])
    game_ids.map { |row| GameResolver.find_by_id(row[0]) }
  end

end