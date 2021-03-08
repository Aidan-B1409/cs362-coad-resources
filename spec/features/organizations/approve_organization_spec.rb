require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

  let(:admin){ create(:user, :admin) }
  let(:pending_organization){ create(:organization, :pending) }

  it 'succeeds' do
    log_in_as(admin)
    org = pending_organization
    visit organizations_url
    click_on 'Pending'
    click_on org.name
    click_on 'Approve'
    expect(page.body).to have_text("Organization #{org.name} has been approved.")
  end
end
