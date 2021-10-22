module Mutations
  module Users
    class CreateUser < BaseMutation
      class AuthProviderSignupData < Types::BaseInputObject
        argument :credentials, Types::AuthProviderCredentialsInput, required: false
      end

      argument :auth_provider, AuthProviderSignupData, required: false

      type Types::UserType

      def resolve(auth_provider: nil)
        User.create!(
          username: auth_provider&.[](:credentials)&.[](:username),
          password: auth_provider&.[](:credentials)&.[](:password)
        )
       end
    end
  end
end
