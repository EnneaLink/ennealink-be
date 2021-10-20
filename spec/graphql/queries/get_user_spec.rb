require 'rails_helper'

RSpec.describe Types::QueryType do
  describe "display user" do
    it 'can query a single user' do
      @u1 = User.create(username: 'funbucket', password: 'password')

      result = EnnealinkBeSchema.execute(query).as_json

      expect(result["data"]["getUser"]["id"]).to eq(@u1.id.to_s)
      expect(result["data"]["getUser"]["username"]).to eq(@u1.username)
    end
  end

  def query
    <<~GQL
    {
      getUser(id: "#{@u1.id}") {
        id
        username
      }
    }
    GQL
  end
end
