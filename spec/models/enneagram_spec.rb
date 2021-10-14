require 'rails_helper'

RSpec.describe Enneagram, type: :model do
  describe 'relationships' do
    it { should have_many(:users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end
