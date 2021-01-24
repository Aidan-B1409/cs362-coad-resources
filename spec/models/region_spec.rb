require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { Region.new}

  it 'has a name' do
    expect(region).to respond_to(:name)
  end

  describe 'assosciations' do
    it { should have_many(:tickets).class_name('Ticket') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:name).case_insensitive()}
  end

end
