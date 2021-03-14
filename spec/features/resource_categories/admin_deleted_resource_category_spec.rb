require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do


  let(:admin) { create(:user, :admin) }
  let(:resource_category) { create(:resource_category) }

  it 'succeeds' do
    log_in_as(admin)
    rc = resource_category
    visit resource_categories_url
    click_on resource_category.name
    click_on 'Delete'

    expect(page.body).to have_text("Category #{resource_category.name} was deleted.")
  end
end
