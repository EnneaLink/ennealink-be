module Types
  class FriendshipType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :friend_id, ID, null: false
  end
end
