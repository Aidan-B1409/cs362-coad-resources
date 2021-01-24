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
    res_cat = resource_category
    res_cat.activate
    expect(res_cat.active).to be_truthy
  end

  it 'deactivates a status' do
    res_cat = resource_category
    res_cat.deactivate
    expect(res_cat.active).to be_falsey
  end

  it 'indicates the activity status of the resource category' do
    res_cat = resource_category
    res_cat.activate
    expect(res_cat.inactive?).to be_falsey

    res_cat.deactivate
    expect(res_cat.inactive?).to be_truthy
  end

  it 'returns the name of the resource category' do
    res_cat = resource_category
    expect(res_cat.to_s).to eq(res_cat.name)
  end

  #Scope functions
  #TODO: how to test when database has no tables? 
  it 'fetches the resource categories which are active' do
    res_cat = resource_category
    res_cat.activate
    expect(ResourceCategory.active).to be_truthy
  end

  #TODO: how to test when database has no tables? 
  it 'fetches the resource categories which are inactive' do
    res_cat = resource_category
    res_cat.deactivate
    expect(ResourceCategory.inactive).to be_truthy
  end

end
