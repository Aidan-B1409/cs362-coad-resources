require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do

  let(:admin) { create(:user, :admin) }
  let(:ticket) { create(:ticket) }

  it 'succeeds' do
    log_in_as(admin)
    tc = ticket
    visit dashboard_url
    click_on tc.name
    click_on 'Close'
    click_on tc.name
    # TODO - better selectors?
    expect(page.body).to have_text("Closed")
  end

end
