require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  context 'unauthenticated users' do
    it 'Redirects get requests for index to sign_in' do
      get :index
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'Redirects get requests for show to sign_in' do
      get :show, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'Redirects get requests for new to sign_in' do
      get :new
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'Redirects post requests for create to sign_in' do
      post :create
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'Redirects post requests for approve to sign_in' do
      post :approve, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'Redirects post requests for reject to sign_in' do
      post :reject, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'Redirects get requests for edit to sign_in' do
      get :edit, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'Redirects patch requests for update to sign_in' do
      patch :update, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'Redirects update requests for update to sign_in' do
      put :update, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  context 'regular users' do
    before do
      reg_usr = build(:user)
      allow(request.env['warden']).to receive(:authenticate!).and_return(reg_usr)
      allow(controller).to receive(:current_user).and_return(reg_usr)
    end

    it 'Redirects get requests for show to dashboard' do
      get :show, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'Redirects get requests for new to dashboard' do
      get :new
      expect(response).to redirect_to(dashboard_url)
    end
    it 'Redirects post requests for create to dashboard' do
      post :create
      expect(response).to redirect_to(dashboard_url)
    end
    it 'Redirects post requests for approve to dashboard' do
      post :approve, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'Redirects post requests for reject to dashboard' do
      post :reject, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'Redirects get requests for edit to dashboard' do
      get :edit, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'Redirects patch requests for update to dashboard' do
      patch :update, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'Redirects update requests for update to dashboard' do
      put :update, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
  end

  context 'organization users' do
    before do
      org_user = build(:user, :organization)
      allow(request.env['warden']).to receive(:authenticate!).and_return(org_user)
      allow(controller).to receive(:current_user).and_return(org_user)
    end

    it 'Redirects post requests for approve to dashboard' do
      post :approve, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'Redirects post requests for reject to dashboard' do
      post :reject, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
  end
  
end
