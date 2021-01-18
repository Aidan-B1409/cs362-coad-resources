require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) {Ticket.new}

  it 'has a name' do
    expect(ticket).to respond_to(:name)
  end

  it 'has a description' do
    expect(ticket).to respond_to(:description)
  end

  it 'has a phone' do
    expect(ticket).to respond_to(:phone)
  end

  it 'has an open/closed state' do
    expect(ticket).to respond_to(:closed)
  end

  describe 'assosciations' do
    it { should belong_to(:region).class_name('Region') }
    it { should belong_to(:resource_category).class_name('ResourceCategory') }
    it { should belong_to(:organization).optional.class_name('Organization')}
  end

  describe 'validations' do
    it{ should validate_presence_of(:name)}
    it{ should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)}
    it{ should validate_length_of(:description).is_at_most(1020).on(:create)}
  end

end
