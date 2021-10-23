require 'rails_helper'

module Mutations
  module Users
    RSpec.describe UpdateUser, type: :request do
      describe '.resolve' do
        it 'updates a user' do
          @pam = create(:user)
          personality_data
          post '/graphql', params: { query: query }
          
          json = JSON.parse(response.body)
          require "pry"; binding.pry
          data = json['data']
          expect(data["user"]["id"]).to eq(@u1.id.to_s)
          expect(data["user"]["username"]).to eq(@u1.username)

          expect(data["user"]["enneagram"]).to be_a(Hash)
          expect(data["user"]["enneagram"]["id"]).to eq(e.id.to_s)
          expect(data["user"]["enneagram"]["number"]).to eq(e.number)
          expect(data["user"]["enneagram"]["name"]).to eq(e.name)
          expect(data["user"]["enneagram"]["description"]).to eq(e.description)
          expect(data["user"]["enneagram"]["link"]).to eq(e.link)

          expect(data["user"]["myersBrigg"]).to be_a(Hash)
          expect(data["user"]["myersBrigg"]["id"]).to eq(mb.id.to_s)
          expect(data["user"]["myersBrigg"]["typeOf"]).to eq(mb.type_of)
          expect(data["user"]["myersBrigg"]["name"]).to eq(mb.name)
          expect(data["user"]["myersBrigg"]["description"]).to eq(mb.description)
          expect(data["user"]["myersBrigg"]["link"]).to eq(mb.link)
        end

        xit 'it returns updated skill in correct position' do
          bob = create(:user, id: 11, name: "Bob", email: "tunt@gmail.com", mod: "4", program: "BE", pronouns: "she/her", slack:"@cheryl_tunt")
          pam = create(:user)
          skill_1 = bob.skills.create(name: "sql")
          skill_2 = bob.skills.create(name: "javascript")
          skill_3 = bob.skills.create(name: "graphql")

          expect(bob.skills).to eq([skill_1, skill_2, skill_3])

          post '/graphql', params: { query: query_2 }

          result = JSON.parse(response.body)
          skills = result["data"]["user"]["skills"]

          expect(skills[0]).to eq('')
          expect(skills[1]).to eq('react')
          expect(skills[2]).to eq('')
        end

        def query
          <<~GQL
          mutation {
            updateUser(
                id: #{@pam.id}
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