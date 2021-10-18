require 'rails_helper'

RSpec.describe Types::QueryType do
  describe "display user stats" do
    it 'can query a single user and thier stats' do
      personality_data
      e = Enneagram.first
      mb = MyersBrigg.second
      u1 = User.create(email: 'dev@2105.com', username: 'funbucket', password: 'password', enneagram_id: e.id, myers_brigg_id: mb.id)

      result = EnnealinkBeSchema.execute(query).as_json
      expect(result["data"]["getUserStats"]["email"]).to eq("dev@2105.com")
      expect(result["data"]["getUserStats"]["username"]).to eq("funbucket")
    end
  end

  def query
    <<~GQL
    {
      getUserStats(id: "1") {
        email
        username
        enneagram{
          id
          number
          name
          description
        }
        myers_brigg{
          id
          type_of
          name
          description
        }
      }
    }
    GQL
  end
end
