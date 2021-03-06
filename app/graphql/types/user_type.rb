module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    # field :email, String, null:false
    field :username, String, null: false
    field :enneagram, Types::EnneagramType, null: true
    field :myers_brigg, Types::MyersBriggType, null: true
    field :friends, [Types::UserType], null: true

    def friends
      object.friends
    end
  end
end
