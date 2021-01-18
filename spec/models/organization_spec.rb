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

  describe 'assosciations' do
    it { should have_many(:users).class_name('User') }
    it { should have_many(:tickets).class_name('Ticket') }
    it { should have_and_belong_to_many(:resource_categories).class_name('ResourceCategory')}
  end

end
