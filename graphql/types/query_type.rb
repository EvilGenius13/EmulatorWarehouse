class QueryType < GraphQL::Schema::Object
  # Base Types
  field :emulators, [EmulatorType], null: false
  field :systems, [SystemType], null: false
  field :games, [GameType], null: false

  # Emulator Arguments
  field :emulatorById, EmulatorType, null: true do
    argument :id, ID, required: true
  end

  field :emulatorByName, EmulatorType, null: true do
    argument :name, String, required: true
  end

  # System Arguments
  field :systemById, SystemType, null: true do
    argument :id, ID, required: true
  end

  field :systemByName, SystemType, null: true do
    argument :name, String, required: true
  end

  # Game Arguments
  field :gameById, GameType, null: true do
    argument :id, ID, required: true
  end

  field :gameByName, GameType, null: true do
    argument :name, String, required: true
  end

  field :gameByEmulatorId, [GameType], null: true do
    argument :emulator_id, ID, required: true
  end

  # Emulator Queries
  def emulators
    EmulatorResolver.all
  end

  def emulatorById(id:)
    EmulatorResolver.find_by_id(id)
  end

  def emulatorByName(name:)
    EmulatorResolver.find_by_name(name)
  end

  # System Queries
  def systems
    SystemResolver.all
  end

  def systemById(id:)
    SystemResolver.find_by_id(id)
  end

  def systemByName(name:)
    SystemResolver.find_by_name(name)
  end

  # Game Queries
  def games
    GameResolver.all
  end

  def gameById(id:)
    GameResolver.find_by_id(id)
  end

  def gameByName(name:)
    GameResolver.find_by_name(name)
  end

  def gameByEmulatorId(emulator_id:)
    GameResolver.find_by_emulator_id(emulator_id)
  end
end