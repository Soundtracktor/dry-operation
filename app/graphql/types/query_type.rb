class Types::QueryType < Types::BaseObject
  field :viewer, Types::User, null: true

  def viewer
    user.first
  end
end
