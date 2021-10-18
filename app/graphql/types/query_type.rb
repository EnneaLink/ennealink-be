module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField
    #
    # field :user, resolver: Queries::User

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :get_user_stats, Types::UserType, null: false, description: 'Returns user stats' do
      argument :id, ID, required: true
    end

    field :get_user, Types::UserType, null: false, description: 'Returns a single user by id' do
      argument :id, ID, required: true
    end

    def get_user_stats(id:)
      User.find(id)
    end

    def get_user(id:)
      User.find(id)
    end
  end
end
