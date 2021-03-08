require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do

  let(:user) { create(:user, :nilorg) }

  # it 'succeeds' do
  #   log_in_as(user)
  #   visit dashboard_url
  #   click_on 'Create Application'
  #   click_on 'Apply'
  #   puts find_button('.organization_agreement')

  #   # todo -select all radio buttons

  #   # click_on 'Pending'
  #   # click_on org.name
  #   # click_on 'Approve'
  #   # expect(page.body).to have_text("Organization #{org.name} has been approved.")
  # end
end
