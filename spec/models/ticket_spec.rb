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

  it 'has a closed time' do
    expect(ticket).to respond_to(:closed_at)
  end

  #Member functions
  it 'detects if a ticket is opened or closed' do
    tic = ticket
    tic.closed = false
    expect(tic.open?).to be_truthy
    tic.closed = true
    expect(tic.open?).to be_falsey
  end

  it 'knows if the ticket is assigned to an organization' do
    tic = ticket
    expect(tic.captured?).to be_falsey
    tic.organization = Organization.new
    expect(tic.captured?).to be_truthy
  end

  it 'returns the ticket name in string format' do
    tic = ticket
    tic.id = 69_420
    expect(tic.to_s).to eq("Ticket #{tic.id}")
  end

  describe 'assosciations' do
    it { should belong_to(:region).class_name('Region') }
    it { should belong_to(:resource_category).class_name('ResourceCategory') }
    it { should belong_to(:organization).optional.class_name('Organization') }
  end

  describe 'validations' do
    it{ should validate_presence_of(:name) }
    it{ should validate_presence_of(:phone) }
    it{ should validate_presence_of(:region_id) }
    it{ should validate_presence_of(:resource_category_id) }
    it{ should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it{ should validate_length_of(:description).is_at_most(1020).on(:create) }
    # TODO: Validate phone phony_plausible true 
  end

end
