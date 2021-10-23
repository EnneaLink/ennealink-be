require 'rails_helper'

module Mutations
  module Users
    RSpec.describe UpdateUser, type: :request do
      describe '.resolve' do
        it 'updates a user' do
          @pam = create(:user)
          personality_data
          e = Enneagram.all[7]
          mb = MyersBrigg.all[13]

          post '/graphql', params: { query: query }
          
          json = JSON.parse(response.body)
          data = json['data']

          expect(data["updateUser"]["id"]).to eq(@pam.id.to_s)
          expect(data["updateUser"]["username"]).to eq(@pam.username)

          expect(data["updateUser"]["enneagram"]).to be_a(Hash)
          expect(data["updateUser"]["enneagram"]["id"]).to eq(e.id.to_s)
          expect(data["updateUser"]["enneagram"]["number"]).to eq(e.number)
          expect(data["updateUser"]["enneagram"]["name"]).to eq(e.name)
          expect(data["updateUser"]["enneagram"]["description"]).to eq(e.description)
          expect(data["updateUser"]["enneagram"]["link"]).to eq(e.link)

          expect(data["updateUser"]["myersBrigg"]).to be_a(Hash)
          expect(data["updateUser"]["myersBrigg"]["id"]).to eq(mb.id.to_s)
          expect(data["updateUser"]["myersBrigg"]["typeOf"]).to eq(mb.type_of)
          expect(data["updateUser"]["myersBrigg"]["name"]).to eq(mb.name)
          expect(data["updateUser"]["myersBrigg"]["description"]).to eq(mb.description)
          expect(data["updateUser"]["myersBrigg"]["link"]).to eq(mb.link)
        end

        it 'it can update a users personality when they previously had it filled out' do
          personality_data
          e = Enneagram.all[7]
          mb = MyersBrigg.all[13]
          e1 = Enneagram.first
          mb1 = MyersBrigg.first
          @pam = create(:user, myers_brigg_id: mb1.id, enneagram_id: e1.id)
          # require "pry"; binding.pry
          post '/graphql', params: { query: query }

          result = JSON.parse(response.body)
          data = result['data']

          expect(data["updateUser"]["id"]).to eq(@pam.id.to_s)
          expect(data["updateUser"]["username"]).to eq(@pam.username)

          expect(data["updateUser"]["enneagram"]).to be_a(Hash)
          expect(data["updateUser"]["enneagram"]["id"]).to eq(e.id.to_s)
          expect(data["updateUser"]["enneagram"]["number"]).to eq(e.number)
          expect(data["updateUser"]["enneagram"]["name"]).to eq(e.name)
          expect(data["updateUser"]["enneagram"]["description"]).to eq(e.description)
          expect(data["updateUser"]["enneagram"]["link"]).to eq(e.link)

          expect(data["updateUser"]["myersBrigg"]).to be_a(Hash)
          expect(data["updateUser"]["myersBrigg"]["id"]).to eq(mb.id.to_s)
          expect(data["updateUser"]["myersBrigg"]["typeOf"]).to eq(mb.type_of)
          expect(data["updateUser"]["myersBrigg"]["name"]).to eq(mb.name)
          expect(data["updateUser"]["myersBrigg"]["description"]).to eq(mb.description)
          expect(data["updateUser"]["myersBrigg"]["link"]).to eq(mb.link)
        end

        def query
          <<~GQL
          mutation {
            updateUser(
                id: "#{@pam.id}"
                username: "Carl Crockett"
                myersBrigg: "ESFJ"
                enneagram: "8"
              )
              {
                id
                username
                enneagram{
                  id
                  number
                  name
                  description
                  link
                }
                myersBrigg{
                  id
                  typeOf
                  name
                  description
                  link
                }
              }
            }
          GQL
        end
      end
    end
  end
end