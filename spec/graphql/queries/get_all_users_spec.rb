require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display all users' do
    it 'can query all users' do
      personality_data

      e = Enneagram.first
      mb = MyersBrigg.second
      @u1 = User.create(username: 'funbucket', password: 'password', enneagram_id: e.id, myers_brigg_id: mb.id)
      @u2 = User.create(username: 'gertie', password: 'sugma', enneagram_id: e.id, myers_brigg_id: mb.id)
      @u3 = User.create(username: 'gunnie', password: 'tugma', enneagram_id: e.id, myers_brigg_id: mb.id)
      friendship = Friendship.create(user_id: @u1.id, friend_id: @u2.id)

      result = EnnealinkBeSchema.execute(query).as_json
      # require "pry"; binding.pry
      expect(result["data"]["getAllUsers"]).to be_an(Array)
      expect(result["data"]["getAllUsers"].size).to eq(3)

      expect(result["data"]["getAllUsers"][0]["id"]).to eq(@u1.id.to_s)
      expect(result["data"]["getAllUsers"][0]["username"]).to eq(@u1.username)
      expect(result["data"]["getAllUsers"][0]["enneagram"]).to be_a(Hash)
      expect(result["data"]["getAllUsers"][0]["enneagram"]["id"]).to eq(e.id.to_s)
      expect(result["data"]["getAllUsers"][0]["enneagram"]["number"]).to eq(e.number)
      expect(result["data"]["getAllUsers"][0]["enneagram"]["name"]).to eq(e.name)
      expect(result["data"]["getAllUsers"][0]["enneagram"]["description"]).to eq(e.description)
      expect(result["data"]["getAllUsers"][0]["enneagram"]["link"]).to eq(e.link)

      expect(result["data"]["getAllUsers"][0]["myersBrigg"]).to be_a(Hash)
      expect(result["data"]["getAllUsers"][0]["myersBrigg"]["id"]).to eq(mb.id.to_s)
      expect(result["data"]["getAllUsers"][0]["myersBrigg"]["typeOf"]).to eq(mb.type_of)
      expect(result["data"]["getAllUsers"][0]["myersBrigg"]["name"]).to eq(mb.name)
      expect(result["data"]["getAllUsers"][0]["myersBrigg"]["description"]).to eq(mb.description)
      expect(result["data"]["getAllUsers"][0]["myersBrigg"]["link"]).to eq(mb.link)
    end
  end

  def query
    <<~GQL
    {
      getAllUsers {
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
