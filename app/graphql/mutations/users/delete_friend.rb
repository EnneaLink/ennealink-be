module Mutations
  module Users
    class DeleteFriend < ::Mutations::BaseMutation
      argument :user_id, ID, required: true
      argument :friend_id, ID, required: true

      field :success, Boolean, null: false


      def resolve(attributes)
        friendship = Friendship.find_by(user_id: attributes[:user_id].to_i, friend_id: attributes[:friend_id].to_i)
        friendship.destroy
        if Friendship.find_by(user_id: attributes[:user_id].to_i, friend_id: attributes[:friend_id].to_i) == nil
          {
            success: true
          }
        end
      end
    end
  end
end