require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do

  let(:user) { create(:user, :organization) }
  let(:ticket) { create(:ticket) }

  it 'succeeds' do
    log_in_as(user)
    tc = ticket
    visit dashboard_url
    click_on 'Tickets'
    click_on tc.name
    click_on 'Capture'
    click_on tc.name
    click_on 'Release'
    click_on tc.name
  
    expect(page.body).to_not have_text("#{user.organization.name}")
  end
end
