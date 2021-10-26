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

          expect(data['user']['id']).to eq(User.first.id.to_s)
          expect(data['user']['username']).to eq('Gertie')
        end

        it 'returns error message if user already exists' do
          User.create!(username: 'Gertie', password: 'password')

          post '/graphql', params: { query: query }

          json = JSON.parse(response.body)

          expect(json['errors'][0]['message']).to eq('Username has already been taken')
        end

        it 'returns error message if password is not given' do
          post '/graphql', params: { query: query2 }

          json = JSON.parse(response.body)

          expect(json['errors'][0]['message']).to eq("Password can't be blank")
        end

        it 'returns error message if username is not given' do
          post '/graphql', params: { query: query3 }

          json = JSON.parse(response.body)

          expect(json['errors'][0]['message']).to eq("Username can't be blank")
        end
      end

      def query
        <<~GQL
        mutation {
          user: createUser(
          authProvider: {
            credentials: {
              username: "Gertie",
              password: "password"
            }
          }
          ) {
            id
            username
            }
          }
        GQL
      end

      def query2
        <<~GQL
        mutation {
          user: createUser(
          authProvider: {
            credentials: {
              username: "Gertie",
              password: ""
            }
          }
          ) {
            id
            username
            }
          }
        GQL
      end

      def query3
        <<~GQL
        mutation {
          user: createUser(
          authProvider: {
            credentials: {
              username: "",
              password: "password"
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
