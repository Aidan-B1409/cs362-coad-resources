require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { Ticket.new }

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
    let(:assigned_open_ticket) { create(:ticket, :open, :assigned) }
    let(:unassigned_open_ticket) { create(:ticket, :open, :unassigned) }
    let(:assigned_closed_ticket) { create(:ticket, :closed, :assigned) }
    let(:unassigned_closed_ticket) { create(:ticket, :closed, :unassigned) }
    let(:closed_ticket) { create(:ticket, :closed) }
    let(:open_ticket) { create(:ticket, :open) }

    describe 'open' do
      it 'Returns any tickets which are open and have not been assigned to an organization' do
        expect(Ticket.open).to include(unassigned_open_ticket)
      end
      it 'Does not return tickets which have been assigned to an organization' do
        expect(Ticket.open).to_not include(assigned_open_ticket)
        expect(Ticket.open).to_not include(assigned_closed_ticket)
      end
      it 'Does not return tickets which have been closed' do
        expect(Ticket.open).to_not include(unassigned_closed_ticket)
      end
    end

    describe 'closed' do
      it 'includes closed tickets' do
        expect(Ticket.closed).to include(closed_ticket)
      end
      it 'does not include non-closed tickets' do
        expect(Ticket.closed).to_not include(open_ticket)
      end
    end

    describe 'organization possession' do
      describe 'all organization' do
        it 'returns all open tickets assigned to an organization' do
          expect(Ticket.all_organization).to include(assigned_open_ticket)
        end
        it 'does not return tickets not assigned to an organization' do
          expect(Ticket.all_organization).to_not include(unassigned_open_ticket)
        end
      end

      describe 'organization validation' do
        it 'returns all active tickets for an organization' do
          expect(Ticket.organization(assigned_open_ticket)).to include(assigned_open_ticket)
        end
        it 'does not return active tickets not assigned to the specified organization' do
          expect(Ticket.organization(assigned_open_ticket)).to_not include(unassigned_open_ticket)
        end
        it 'does not include closed tickets even if they are assigned to the specified organization' do
          expect(Ticket.organization(assigned_open_ticket)).to_not include(assigned_closed_ticket)
        end
      end

      describe 'closed_organization' do
        it 'Returns all closed tickets for a given organization' do
          expect(Ticket.closed_organization(assigned_closed_ticket)).to include(assigned_closed_ticket)
        end
        it 'Does not return open tickets for that organization' do
          expect(Ticket.closed_organization(assigned_closed_ticket)).to_not include(assigned_open_ticket)
        end
        it 'does not return closed tickets for a different organization' do
          expect(Ticket.closed_organization(assigned_closed_ticket)).to_not include(unassigned_closed_ticket)
        end
      end
    end

    describe 'region' do
      let(:in_region_ticket) { create(:ticket) }
      let(:new_region) { create(:region, name:'New Fake') }
      let(:other_region_ticket) do
        create(:ticket)
        in_region_ticket.region = new_region
      end

      it 'returns a ticket in a specific region' do
        expect(Ticket.region(in_region_ticket.region_id)).to include(in_region_ticket)
      end
      it 'does not return a ticket not included in the region' do
        expect(Ticket.region(new_region.id))
      end
    end

    describe 'resource category' do
      let(:cat1) { create(:resource_category) }
      let(:rescat_ticket) { create(:ticket, resource_category: cat1) }
      let(:ticket_shares_rescat) { create(:ticket, resource_category: cat1) }
      let(:ticket_different_rescat) { create(:ticket, resource_category: create(:resource_category)) }

      it 'Returns tickets which share a resource category' do
        expect(Ticket.resource_category(rescat_ticket)).to include(rescat_ticket)
        expect(Ticket.resource_category(rescat_ticket)).to include(ticket_shares_rescat)
      end

      it 'Does not return tickets with a different resource category' do
        expect(Ticket.resource_category(rescat_ticket)).to_not include(ticket_different_rescat)
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
    
    describe 'phony plausible' do
      let(:ticket_valid_phone) { create(:ticket, :valid_phone) }
      let(:ticket_invalid_phone) { create(:ticket, :invalid_phone) }
      it 'verifies that a valid phone number is valid' do
        expect { ticket_valid_phone.save! }.to_not raise_error(ActiveRecord::RecordInvalid)
      end
      it 'fails to validate invalid phone numbers ' do
        expect { ticket_invalid_phone.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
