require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  context 'unauthenticated users' do
    before do
      reg_usr = build(:user)
      allow(controller).to receive(:current_user).and_return(reg_usr)
    end
    it 'redirects post requests to capture to sign_in' do
      post :capture, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects post requests to release to sign_in' do
      post :release, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects patch requests to close to sign_in' do
      patch :close, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects get requests to show to sign_in' do
      get :show, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects delete requests to destroy to the dashboard' do
      delete :destroy, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
  end

  context 'logged-in users' do
    before do
      reg_usr = build(:user)
      allow(request.env['warden']).to receive(:authenticate!).and_return(reg_usr)
      allow(controller).to receive(:current_user).and_return(reg_usr)
    end
    it 'redirects post requests to capture to the dashboard' do
      post :capture, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects post requests to release to the dashboard' do
      post :release, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects patch requests to close to the dashboard' do
      patch :close, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects get requests to show to the dashboard' do
      get :show, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects delete requests to destroy to dashboard' do
      delete :destroy, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
  end

  context 'organization users' do
    before do
      org_usr = build(:user, :organization)
      allow(request.env['warden']).to receive(:authenticate!).and_return(org_usr)
      allow(controller).to receive(:current_user).and_return(org_usr)
    end
    it 'redirects delete requests to destroy to dashboard' do
      delete :destroy, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
  end
end
