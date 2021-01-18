require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) {ResourceCategory.new}
  it 'has a name' do
    expect(resource_category).to respond_to(:name)
  end
  it 'has an activity state' do
    expect(resource_category).to respond_to(:active)
  end

  describe 'assosciations' do
    it { should have_and_belong_to_many(:organizations).class_name('Organization') }
    it { should have_many(:tickets).class_name('Ticket') }
  end

end
