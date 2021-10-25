module Mutations
  module Users
    class CreateUser < BaseMutation
      class AuthProviderSignupData < Types::BaseInputObject
        argument :credentials, Types::AuthProviderCredentialsInput, required: false
      end

      argument :auth_provider, AuthProviderSignupData, required: false

      type Types::UserType

      field :user, Types::UserType, null: false

      def resolve(auth_provider: nil)
        # binding.pry
        user = User.new(
          username: auth_provider&.[](:credentials)&.[](:username),
          password: auth_provider&.[](:credentials)&.[](:password)
        )
        if user.save
          user
        else
          raise GraphQL::ExecutionError, user.errors.full_messages.join(", ")
        end
       end
    end
  end
end
