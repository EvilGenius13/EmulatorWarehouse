class SystemResolver
  def self.all
    DB.execute("SELECT * FROM systems").map do |row|
      {
        id: row[0],
        name: row[1]
      }
    end
  end

  def self.find_by_id(id)
    result = DB.execute("SELECT * FROM systems WHERE id = ?", id).first
    result ? {
      id: result[0],
      name: result[1]
    } : nil
  end

  def self.find_by_name(name)
    result = DB.execute("SELECT * FROM systems WHERE name = ?", name).first
    result ? {
      id: result[0],
      name: result[1]
    } : nil
  end
end