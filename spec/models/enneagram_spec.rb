require 'rails_helper'

RSpec.describe Enneagram, type: :model do
  describe 'relationships' do
    it { should have_many(:users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:number) }
    it { should allow_value(1).for(:number) }
    it { should allow_value(9).for(:number) }
    it { should_not allow_value(0).for(:number) }
    it { should_not allow_value(10).for(:number) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:link) }
  end
end
