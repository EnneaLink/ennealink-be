module Mutations
  module Users
    class CreateUser < ::Mutations::BaseMutation
      class AuthProviderSignupData < Types::BaseInputObject
        argument :credentials, Types::AuthProviderCredentialsInput, required: false
      end

      argument :username, String, required: true
      argument :auth_provider, AuthProviderSignupData, required: false

      type Types::UserType

      def resolve(username: nil, auth_provider: nil)
        User.create!(
          username: username,
          password: auth_provider&.[](:credentials)&.[](:password)
        )
      end
    end
  end
end
