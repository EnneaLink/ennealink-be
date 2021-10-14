require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should belong_to(:myers_brigg) }
    it { should belong_to(:enneagram) }
    it { should have_many(:friendships) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end
end
