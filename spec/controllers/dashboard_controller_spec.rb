require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  context 'unauthenticated users' do
    it 'redirects get requests for index to sign_in' do
      get :index
      expect(response).to redirect_to(new_user_session_url)
    end
  end
  context 'organization users' do
    before do
      org_usr = build(:user, :organization)
      allow(request.env['warden']).to receive(:authenticate!).and_return(org_usr)
      allow(controller).to receive(:current_user).and_return(org_usr)
    end
    it 'allows get requests to index' do
      get :index
      expect(response).to be_successful
    end
  end
  context 'admin users' do
    before do
      admin_usr = build(:user, :admin)
      allow(request.env['warden']).to receive(:authenticate!).and_return(admin_usr)
      allow(controller).to receive(:current_user).and_return(admin_usr)
    end
    it 'allows get requests to index' do
      get :index
      expect(response).to be_successful
    end
  end
end
