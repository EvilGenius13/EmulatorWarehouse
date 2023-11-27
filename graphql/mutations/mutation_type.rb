class MutationType < GraphQL::Schema::Object
  field :createEmulator, EmulatorType, null: false do
    argument :name, String, required: true
    argument :version, String, required: true
    argument :release_date, GraphQL::Types::ISO8601Date, required: true
    argument :download_link, String, required: true
  end

  def create_emulator(name:, version:, release_date:, download_link:)
    EmulatorMutationResolver.create_emulator(name: name, version: version, release_date: release_date, download_link: download_link)
  end
end