require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:friend) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:friend_id).scoped_to(:user_id) }
  end
end
