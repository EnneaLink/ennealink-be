require 'rails_helper'

module Mutations
  module Users
    RSpec.describe LoginUser, type: :request do
      describe '.resolve' do
        it 'logins a valid user' do
          @u1 = User.create(username: 'Gertie', password: 'password')

          post '/graphql', params: {query: query}

          json = JSON.parse(response.body)
          data = json['data']

          expect(data['loginUser']['id']).to eq(@u1.id.to_s)
          expect(data['loginUser']['success']).to eq(true)
        end

        it 'fails login with bad password' do
          @u1 = User.create(username: 'Gertie', password: 'password')

          post '/graphql', params: {query: query2}

          json = JSON.parse(response.body)
          errors = json['errors']
          
          expect(errors[0]['message']).to eq('Invalid input: Credentials Invalid!')
        end
      end

      def query
        <<~GQL
        mutation {
          loginUser(
            username: "Gertie",
            password: "password"
          )
            {
              id
              success
            }
          }
        GQL
      end

      def query2
        <<~GQL
        mutation {
          loginUser(
            username: "Gertie",
            password: "not_the_password"
          )
            {
              id
              success
            }
          }
        GQL
      end
    end
  end
end
