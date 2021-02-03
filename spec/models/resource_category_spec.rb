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

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:name).case_insensitive()}
  end

  #Member functions
  it 'activates a status' do
    resource_category.activate
    expect(resource_category.active).to be_truthy
  end

  it 'deactivates a status' do
    resource_category.deactivate
    expect(resource_category.active).to be_falsey
  end

  it 'indicates the activity status of the resource category' do
    resource_category.activate
    expect(resource_category.inactive?).to be_falsey

    resource_category.deactivate
    expect(resource_category.inactive?).to be_truthy
  end

  it 'returns the name of the resource category' do
    expect(resource_category.to_s).to eq(resource_category.name)
  end

  #Scope functions

  describe 'activity methods' do
    it 'fetches the resource categories which are active' do
      active_resource_category = ResourceCategory.create(name: 'Active Category', active: true)
      inactive_resource_category = ResourceCategory.create(name: 'Inactive Category', active: false)
      expect(ResourceCategory.active).to include(active_resource_category)
      expect(ResourceCategory.active).to_not include(inactive_resource_category)
    end

    it 'fetches the resource categories which are inactive' do
      active_resource_category = ResourceCategory.create(name: 'Active Category', active: true)
      inactive_resource_category = ResourceCategory.create(name: 'Inactive Category', active: false)
      expect(ResourceCategory.inactive).to_not include(active_resource_category)
      expect(ResourceCategory.inactive).to include(inactive_resource_category)
    end
  end
end
