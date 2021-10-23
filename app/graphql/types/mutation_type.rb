module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::Users::CreateUser
    field :login_user, mutation: Mutations::Users::LoginUser
    field :update_user, mutation: Mutations::Users::UpdateUser
  end
end
