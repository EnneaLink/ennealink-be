module Mutations
  module Users
    class UpdateUser < ::Mutations::BaseMutation
      argument :id, ID, required: true
      argument :username, String, required: false
      argument :enneagram, String, required: false
      argument :myers_brigg, String, required: false

      type Types::UserType

      def resolve(id:, **attributes)
        user = User.find_by(id: id.to_i)

        if attributes[:myers_brigg].present? && attributes[:enneagram].present?
          e = Enneagram.find_by(number: attributes[:enneagram].to_i)
          myers = MyersBrigg.find_by(type_of: attributes[:myers_brigg])
          user.update(enneagram_id: e.id, myers_brigg_id: myers.id)
        elsif attributes[:myers_brigg].present?
          myers = MyersBrigg.find_by(type_of: attributes[:myers_brigg])
          user.update(myers_brigg_id: myers.id)
        elsif attributes[:enneagram].present?
          e = Enneagram.find_by(number: attributes[:enneagram].to_i)
          user.update(enneagram_id: e.id)
        else attributes[:username].present?
          user.update(username: attributes[:username])
        end
        user
      end
    end
  end
end
