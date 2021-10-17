module Types
  class MyersBriggType < Types::BaseObject
    field :id, ID, null: false
    field :type_of, Integer, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :link, String, null: false
    field :user, [Types::UserType], null: true
  end
end
