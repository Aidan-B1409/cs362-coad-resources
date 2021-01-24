require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:org) {Organization.new}
  it 'has agreements' do
    agreements = [:agreement_one, :agreement_two, :agreement_three,
      :agreement_four, :agreement_five, :agreement_six, :agreement_seven,
      :agreement_eight]
    agreements.each do |agr|
      expect(org).to respond_to(agr)
    end
  end

  it 'has a status' do
    expect(org).to respond_to(:status)
  end
  
  it 'has a transportation enum' do
    expect(org).to respond_to(:transportation)
  end

  it 'has an email' do
    expect(org).to respond_to(:email)
  end

  it 'has a name' do
    expect(org).to respond_to(:name)
  end

  it 'has a description' do
    expect(org).to respond_to(:description)
  end

  it 'has a phone' do
    expect(org).to respond_to(:phone)
  end

  it 'has a rejection reason' do
    expect(org).to respond_to(:rejection_reason)
  end

  it 'has liability insurance' do
    expect(org).to respond_to(:liability_insurance)
  end

  it 'has a primary name' do
    expect(org).to respond_to(:primary_name)
  end

  it 'has a secondary name' do
    expect(org).to respond_to(:secondary_name)
  end

  it 'has a secondary phone' do
    expect(org).to respond_to(:secondary_phone)
  end

  it 'has a title' do
    expect(org).to respond_to(:title)
  end

  describe 'assosciations' do
    it { should have_many(:users).class_name('User') }
    it { should have_many(:tickets).class_name('Ticket') }
    it { should have_and_belong_to_many(:resource_categories).class_name('ResourceCategory')}
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:primary_name) }
    it { should validate_presence_of(:secondary_name) }
    it { should validate_presence_of(:secondary_phone) }
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
    # TODO: validates :email "format"
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:description).is_at_most(1020).on(:create)}

  end

end
