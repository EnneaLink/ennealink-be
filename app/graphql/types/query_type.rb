module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    field :get_user_stats, Types::UserType, null: false do
      description 'Returns user stats'
      argument :id, ID, required: true
    end

    field :get_user, Types::UserType, null: false do
      description 'Returns a single user by id'
      argument :id, ID, required: true
    end

    field :get_all_users, [Types::UserType], null: false do
      description 'Returns all users'
    end

    def get_all_users
      User.all
    end

    def get_user_stats(id:)
      User.find(id)
    end

    def get_user(id:)
      User.find(id)
    end
  end
end
