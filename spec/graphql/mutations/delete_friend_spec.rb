require 'rails_helper'

module Mutations
  module Users
    RSpec.describe DeleteFriend, type: :request do
      describe '.resolve' do
        it 'deletes friends to the current user' do
          @pam = create(:user)
          @metal = create(:user)
          create(:friendship, user: @pam, friend: @metal)
          post '/graphql', params: { query: query }
          
          json = JSON.parse(response.body)
          data = json['data']

          expect(data["deleteFriend"]["success"]).to eq(true)
        end

        xit 'it does not create friendship' do
          @pam = create(:user)

          post '/graphql', params: { query: query2 }

          result = JSON.parse(response.body)
          data = result['data']

          expect(data["addFriend"]["success"]).to eq(false)
        end
        def query
          <<~GQL
          mutation {
            deleteFriend(
                userId: "#{@pam.id}"
                friendId: "#{@metal.id}"
              )
              {
                success
              }
            }
          GQL
        end

        def query2
          <<~GQL
          mutation {
            deleteFriend(
                userId: "#{@pam.id}"
                friendId: "69"
              )
              {
                success
              }
            }
          GQL
        end
      end
    end
  end
end