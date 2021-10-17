module Types
  class UserType < Type::BaseObject
    field :id, ID, null: false
    field :email, String, null:false
    field :username, String, null: false
    field :enneagram, Types::EnneagramType, null: false, preload: :enneagram
    field :myers_brigg, Types::MyersBriggType, null: false, preload: :myers_brigg
  end
end
