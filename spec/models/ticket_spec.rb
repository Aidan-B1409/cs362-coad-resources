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
    ticket.closed = false
    expect(ticket.open?).to be_truthy
    ticket.closed = true
    expect(ticket.open?).to be_falsey
  end

  it 'knows if the ticket is assigned to an organization' do
    expect(ticket.captured?).to be_falsey
    ticket.organization = Organization.new
    expect(ticket.captured?).to be_truthy
  end

  it 'returns the ticket name in string format' do
    ticket.id = 69_420
    expect(ticket.to_s).to eq("Ticket #{ticket.id}")
  end

  describe 'scopes' do

    describe 'organization possession' do
      let(:assigned_open_ticket) { create(:ticket, :open, :assigned) }
      let(:unassigned_open_ticket) { build(:ticket, :open, :unassigned) }
      let(:assigned_closed_ticket) { build(:ticket, :closed, :assigned) }

      describe 'all organization' do
        it 'returns all open tickets assigned to an organization' do
          expect(Ticket.all_organization).to include(assigned_open_ticket)
        end
        it 'does not return tickets not assigned to an organization' do
          expect(Ticket.all_organization).to_not include(unassigned_open_ticket)
        end
      end
    end

    describe 'closed' do
      let(:closed_ticket) { build(:ticket, :closed) }
      let(:open_ticket) { build(:ticket, :open) }

      it 'includes closed tickets' do
        expect(Ticket.closed).to include(closed_ticket)
      end
      it 'does not include non-closed tickets' do
        expect(Ticket.closed).to_not include(open_ticket)
      end
    end
  end

  describe 'assosciations' do
    it { should belong_to(:region).class_name('Region') }
    it { should belong_to(:resource_category).class_name('ResourceCategory') }
    it { should belong_to(:organization).optional.class_name('Organization') }
  end

  describe 'validations' do
    it{ should validate_presence_of(:name) }
    it{ should validate_presence_of(:phone) }
    it{ should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it{ should validate_length_of(:description).is_at_most(1020).on(:create) }
    # TODO: Validate phone phony_plausible true 
  end

end
