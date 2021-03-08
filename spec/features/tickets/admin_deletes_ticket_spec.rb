require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do

  let(:admin) { create(:user, :admin) }
  let(:ticket) { create(:ticket) }

  it 'succeeds' do
    log_in_as(admin)
    tc = ticket
    visit dashboard_url
    click_on tc.name
    click_on 'Delete'
    # TODO - handle accepting alerts 
    alert = page.driver.browser.switch_to.alert
    alert.accept
    expect(page.body).to have_text("#{tc.name} was deleted.")
  end

end
