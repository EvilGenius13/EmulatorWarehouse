require 'graphql'
require_relative 'emulator_type'
require_relative 'system_type'
require_relative 'game_type'

class QueryType < GraphQL::Schema::Object
  field :emulators, [EmulatorType], null: false
  field :systems, [SystemType], null: false
  field :games, [GameType], null: false

  field :emulator, EmulatorType, null: true do
    argument :id, ID, required: true
  end

  def emulators
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

  def emulator(id:)
    DB.execute("SELECT * FROM emulators WHERE id = ?", id).map do |row|
      {
        id: row[0],
        name: row[1],
        version: row[2],
        release_date: row[3],
        download_link: row[4]
      }
    end
  end

  def systems
    DB.execute("SELECT * FROM systems").map do |row|
      {
        id: row[0],
        name: row[1]
      }
    end
  end

  def games
    DB.execute("SELECT * FROM games").map do |row|
      {
        id: row[0],
        name: row[1],
        release_date: row[2],
        system_id: row[3]
      }
    end
  end
end