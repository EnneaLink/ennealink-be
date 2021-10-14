require 'rails_helper'

RSpec.describe MyersBrigg, type: :model do
  describe 'relationships' do
    it { should have_many(:users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end
