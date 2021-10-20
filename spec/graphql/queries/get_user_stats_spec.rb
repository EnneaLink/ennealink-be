require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display user stats' do
    it 'can query a single user and thier stats' do
      personality_data

      e = Enneagram.first
      mb = MyersBrigg.second
      @u1 = User.create(username: 'funbucket', password: 'password', enneagram_id: e.id, myers_brigg_id: mb.id)
      @u2 = User.create(username: 'gerdy', password: 'sugma', enneagram_id: e.id, myers_brigg_id: mb.id)
      friendship = Friendship.create(user_id: @u1.id, friend_id: @u2.id)

      result = EnnealinkBeSchema.execute(query).as_json

      expect(result["data"]["getUserStats"]["id"]).to eq(@u1.id.to_s)
      expect(result["data"]["getUserStats"]["username"]).to eq(@u1.username)

      expect(result["data"]["getUserStats"]["enneagram"]).to be_a(Hash)
      expect(result["data"]["getUserStats"]["enneagram"]["id"]).to eq(e.id.to_s)
      expect(result["data"]["getUserStats"]["enneagram"]["number"]).to eq(e.number)
      expect(result["data"]["getUserStats"]["enneagram"]["name"]).to eq(e.name)
      expect(result["data"]["getUserStats"]["enneagram"]["description"]).to eq(e.description)
      expect(result["data"]["getUserStats"]["enneagram"]["link"]).to eq(e.link)

      expect(result["data"]["getUserStats"]["myersBrigg"]).to be_a(Hash)
      expect(result["data"]["getUserStats"]["myersBrigg"]["id"]).to eq(mb.id.to_s)
      expect(result["data"]["getUserStats"]["myersBrigg"]["typeOf"]).to eq(mb.type_of)
      expect(result["data"]["getUserStats"]["myersBrigg"]["name"]).to eq(mb.name)
      expect(result["data"]["getUserStats"]["myersBrigg"]["description"]).to eq(mb.description)
      expect(result["data"]["getUserStats"]["myersBrigg"]["link"]).to eq(mb.link)

      expect(result["data"]["getUserStats"]["friends"]).to be_a(Array)
      expect(result["data"]["getUserStats"]["friends"].size).to eq(1)
      expect(result["data"]["getUserStats"]["friends"][0]["username"]).to eq(@u2.username)
    end
  end

  def query
    <<~GQL
    {
      getUserStats(id: "#{@u1.id}") {
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
        friends{
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
    }
    GQL
  end
end
