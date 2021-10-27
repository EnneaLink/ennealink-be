module Mutations
  module Users
    class LoginUser < GraphQL::Schema::Mutation
      argument :username, String, required: true do
        description "The user's username"
      end

      argument :password, String, required: true do
        description "The user's password"
      end

      field :success, Boolean, null: false
      field :id, ID, null: false

      def resolve(attributes)
        user = User.find_by(username: attributes[:username])
        valid_sign_in = user.present? && user.authenticate(attributes[:password])
        if valid_sign_in
          {
            success: true,
            id: valid_sign_in.id
          }
        else
          {
            success: false,
            id: 'nil'
          }
        end
      end
    end
  end
end
