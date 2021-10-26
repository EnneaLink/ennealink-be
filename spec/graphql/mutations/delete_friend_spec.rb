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
      end
    end
  end
end