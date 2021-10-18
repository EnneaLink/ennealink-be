require 'rails_helper'

RSpec.describe Types::QueryType do
  describe "display user" do
    it 'can query a single user' do
      personality_data
      e = Enneagram.first
      mb = MyersBrigg.second
      u1 = User.create(email: 'dev@2105.com', username: 'funbucket', password: 'password', enneagram_id: e.id, myers_brigg_id: mb.id)


      result = EnnealinkBeSchema.execute(user_query).as_json
      expect(result["data"]["getUser"]["email"]).to eq("dev@2105.com")
      expect(result["data"]["getUser"]["username"]).to eq("funbucket")
    end
  end

  def user_query
    <<~GQL
    {
      getUser(id: "1") {
        email
        username
      }
    }
    GQL
  end
end
