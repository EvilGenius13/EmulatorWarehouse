class EmulatorMutationResolver
  def self.create_emulator(name:, version:, release_date:, download_link:)
    DB.execute("INSERT INTO emulators (name, version, release_date, download_link) VALUES (?, ?, ?, ?)", name, version, release_date, download_link)
    id = DB.last_insert_row_id
    EmulatorResolver.find_by_id(id)
  end
end