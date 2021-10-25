module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::Users::CreateUser
    field :login_user, mutation: Mutations::Users::LoginUser
    field :update_user, mutation: Mutations::Users::UpdateUser
    field :add_friend, mutation: Mutations::Users::AddFriend
    field :delete_friend, mutation: Mutations::Users::DeleteFriend
  end
end
