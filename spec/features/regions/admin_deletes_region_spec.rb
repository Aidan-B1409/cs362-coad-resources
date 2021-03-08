require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

  let(:admin) { create(:user, :admin) }
  let(:region) { create(:region) }
  

  it 'succeeds' do
    log_in_as(admin)
    reg = region
    visit regions_url
    click_on region.name
    click_on 'Delete'
    # TODO - handle accepting alerts 
    alert = page.driver.browser.switch_to.alert
    alert.accept
    expect(page.body).to have_text("Region test was deleted.")
  end

end
