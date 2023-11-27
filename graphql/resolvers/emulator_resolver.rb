class EmulatorResolver
  def self.all
    DB.execute("SELECT * FROM emulators").map do |row|
      {
        id: row[0],
        name: row[1],
        version: row[2],
        release_date: row[3],
        download_link: row[4]
      }
    end
  end
  
  def self.find_by_id(id)
    result = DB.execute("SELECT * FROM emulators WHERE id = ?", id).first
    result ? {
      id: result[0],
      name: result[1],
      version: result[2],
      release_date: result[3],
      download_link: result[4]
    } : nil
  end

  def self.find_by_name(name)
    result = DB.execute("SELECT * FROM emulators WHERE name = ?", name).first
    result ? {
      id: result[0],
      name: result[1],
      version: result[2],
      release_date: result[3],
      download_link: result[4]
    } : nil
  end
end