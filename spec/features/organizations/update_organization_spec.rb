require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do

  let(:user) { create(:user, :organization) }

  it 'succeeds' do
    log_in_as(user)
    visit dashboard_url
    click_on 'Edit Organization'
    fill_in 'Name', with: 'A Miraculous Organization'
    click_on 'Update Resource'
    
    visit dashboard_url
    click_on 'My Organization'
    # TODO - better way to test with a selector? 
    expect(page.body).to have_text("A Miraculous Organization")

  end

end
