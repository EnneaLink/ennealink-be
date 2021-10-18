module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null:false
    field :username, String, null: false
    field :enneagram, Types::EnneagramType, null: true
    field :myers_brigg, Types::MyersBriggType, null: true
    # Do enneagram and myers_brigg need `null: false` ? not sure

    # def enneagram
    #   Enneagram.find(object.enneagram_id)
    # end
    #
    # def myers_brigg
    #   MyersBrigg.find(object.myers_brigg_id)
    # end
  end
end
