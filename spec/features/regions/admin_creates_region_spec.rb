require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

  let(:admin) { create(:user, :admin) }
  
  it 'succeeds' do
    log_in_as(admin)
    visit regions_url
    click_on 'Add Region'
    fill_in 'Name', with: 'yeetown'
    click_on 'Add Region'
    expect(page.body).to have_text("Region successfully created.")
  end

end
