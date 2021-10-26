module Mutations
  module Users
    class LoginUser < GraphQL::Schema::Mutation
      argument :username, String, required: true do
        description "The user's username"
      end

      argument :password, String, required: true do
        description "The user's password"
      end

      type Types::UserType
      field :user, Types::UserType, null: false

      def resolve(attributes)
        user = User.find_by(username: attributes[:username])
        valid_sign_in = user.present? && user.authenticate(attributes[:password])
        
        if valid_sign_in
          user
        else
          GraphQL::ExecutionError.new("Invalid input: Credentials Invalid!")
        end
      end
    end
  end
end
