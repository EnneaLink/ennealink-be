require 'rails_helper'

RSpec.describe Types::QueryType do
  describe "display user" do
    it 'can query a single user' do
      @u1 = User.create(email: 'dev@2105.com', username: 'funbucket', password: 'password')

      result = EnnealinkBeSchema.execute(query).as_json
      expect(result["data"]["getUser"]["email"]).to eq("dev@2105.com")
      expect(result["data"]["getUser"]["username"]).to eq("funbucket")
    end
  end

  def query
    <<~GQL
    {
      getUser(id: "#{@u1.id}") {
        email
        username
      }
    }
    GQL
  end
end
