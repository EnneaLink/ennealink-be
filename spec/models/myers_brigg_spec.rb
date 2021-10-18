require 'rails_helper'

RSpec.describe MyersBrigg, type: :model do
  describe 'relationships' do
    it { should have_many(:users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:type_of) }
    it { should allow_value('INFJ').for(:type_of) }
    it { should_not allow_value('INFJ0').for(:type_of) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:link) }
  end
end
