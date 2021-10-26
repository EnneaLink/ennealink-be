module Mutations
  module Users
    class AddFriend < ::Mutations::BaseMutation
      argument :user_id, ID, required: true
      argument :friend_id, ID, required: true

      field :success, Boolean, null: false


      def resolve(attributes)
        friendship = Friendship.new(user_id: attributes[:user_id].to_i, friend_id: attributes[:friend_id].to_i)
        if friendship.save
          {
            success: true
          }
        else
          {
            success: false
          }
        end
      end
    end
  end
end