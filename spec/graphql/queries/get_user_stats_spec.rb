require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display user stats' do
    it 'can query a single user and thier stats' do
      personality_data

      e = Enneagram.first
      mb = MyersBrigg.second
      @u1 = User.create(email: 'dev@2105.com', username: 'funbucket', password: 'password', enneagram_id: e.id, myers_brigg_id: mb.id)

      result = EnnealinkBeSchema.execute(query).as_json

      expect(result["data"]["getUserStats"]["id"]).to eq(@u1.id.to_s)
      expect(result["data"]["getUserStats"]["email"]).to eq(@u1.email)
      expect(result["data"]["getUserStats"]["username"]).to eq(@u1.username)

      expect(result["data"]["getUserStats"]["enneagram"]).to be_a(Hash)
      expect(result["data"]["getUserStats"]["enneagram"]["id"]).to eq(e.id.to_s)
      expect(result["data"]["getUserStats"]["enneagram"]["number"]).to eq(e.number)
      expect(result["data"]["getUserStats"]["enneagram"]["name"]).to eq(e.name)
      expect(result["data"]["getUserStats"]["enneagram"]["description"]).to eq(e.description)

      expect(result["data"]["getUserStats"]["myersBrigg"]).to be_a(Hash)
      expect(result["data"]["getUserStats"]["myersBrigg"]["id"]).to eq(mb.id.to_s)
      expect(result["data"]["getUserStats"]["myersBrigg"]["typeOf"]).to eq(mb.type_of)
      expect(result["data"]["getUserStats"]["myersBrigg"]["name"]).to eq(mb.name)
      expect(result["data"]["getUserStats"]["myersBrigg"]["description"]).to eq(mb.description)
    end
  end

  def query
    <<~GQL
    {
      getUserStats(id: "#{@u1.id}") {
        id
        email
        username
        enneagram{
          id
          number
          name
          description
        }
        myersBrigg{
          id
          typeOf
          name
          description
        }
      }
    }
    GQL
  end
end
