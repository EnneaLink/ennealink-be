module Types
  class EnneagramType < Types::BaseObject
    field :id, ID, null: false
    field :number, Integer, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :link, String, null: false
    field :users, [Types::UserType], null: true
  end
end
