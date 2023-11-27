class GameResolver
  def self.all
    DB.execute("SELECT * FROM games").map do |row|
      {
        id: row[0],
        name: row[1],
        release_date: row[2],
        download_link: row[3]
      }
    end
  end

  def self.find_by_id(id)
    result = DB.execute("SELECT * FROM games WHERE id = ?", id).first
    result ? {
      id: result[0],
      name: result[1],
      release_date: result[2],
      download_link: result[3]
    } : nil
  end

  def self.find_by_name(name)
    result = DB.execute("SELECT * FROM games WHERE name = ?", name).first
    result ? {
      id: result[0],
      name: result[1],
      release_date: result[2],
      download_link: result[3]
    } : nil
  end

  def self.find_by_emulator_id(emulator_id)
    game_ids = DB.execute("SELECT game_id FROM games_emulators WHERE emulator_id = ?", emulator_id)
    game_ids.map { |row| GameResolver.find_by_id(row[0]) }
  end
end
