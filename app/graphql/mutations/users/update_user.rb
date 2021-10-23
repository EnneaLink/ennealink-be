module Mutations
  module Users
    class UpdateUser < ::Mutations::BaseMutation
      argument :id, Integer, required: true
      argument :username, String, required: false
      argument :enneagram, String, required: false
      argument :myers_brigg, String, required: false

      type Types::UserType

      def resolve(id:, **attributes)
        e = Enneagram.find_by(number: attributes[:enneagram].to_i)
        myers = MyersBrigg.find_by(type_of: attributes[:myers_brigg])
        user = User.find_by(id: id)
        user.update(enneagram_id: e.id, myers_brigg_id: myers.id)
        # require "pry"; binding.pry
      end
    end
  end
end