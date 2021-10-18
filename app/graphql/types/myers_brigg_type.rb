module Types
  class MyersBriggType < Types::BaseObject
    field :id, ID, null: false
    field :type_of, String, null: false
    field :name, String, null: false
    field :description, String, null: false
    # add link info and change to null:false
    field :link, String, null: true
    field :users, [Types::UserType], null: true
  end
end
