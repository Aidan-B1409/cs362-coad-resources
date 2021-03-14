require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

  let(:user) { create(:user, :organization) }
  let(:resource_category) { create(:resource_category) }
  let(:region) { create(:region) }

  it 'succeeds' do
    visit '/'
    rg = region 
    rc = resource_category
    click_on 'Get Help'
    fill_in 'Full Name', with: 'fakey mcfakeface'
    fill_in 'Phone Number', with: '541-867-5309'

    select(region.name, from: 'ticket_region_id')
    select(resource_category.name, from: 'ticket_resource_category_id')

    fill_in 'Description', with: 'help pls'
    click_on 'Send this help request'
    click_on 'Return To Home'

    # Now that the ticket has been created - validate it's actually visible
    log_in_as(user)
    visit dashboard_url
    click_on 'Tickets'
    expect(page.body).to have_text("fakey mcfakeface")
  end
end
