require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should belong_to(:myers_brigg) }
    it { should belong_to(:enneagram) }
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
  end

  describe 'validations' do
    # it { should validate_presence_of(:email) }
    # it { should validate_uniqueness_of(:email) }
    # it { should allow_value('k@gmail.com').for(:email) }
    # it { should_not allow_value('kgmail.com').for(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password) }
  end
end
