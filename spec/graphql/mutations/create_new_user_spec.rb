require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      describe '.resolve' do
        it 'creates a user' do
          expect(User.count).to eq(0)
          post '/graphql', params: {query: query}
          expect(User.count).to eq(1)
        end

        it 'returns a user' do
          post '/graphql', params: { query: query }

          json = JSON.parse(response.body)
          data = json['data']

          expect(data['user']['id']).to eq(User.first.id)
          expect(data['user']['username']).to eq('Gertie')
        end
      end

      def query
        <<~GQL
        mutation {
          user: createUser(
          authProvider: {
            credentials: {
              username: 'Gertie'
              password: 'password'
            }
          }
          ) {
            id
            username
            }
          }
        GQL
      end
    end
  end
end
