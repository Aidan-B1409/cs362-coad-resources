require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

  context 'unauthenticated users' do
    it 'redirects get requests for index to sign_in' do
      get :index
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'redirects get requests for show to sign_in' do
      get :show, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'redirects get requests for new to sign_in' do
      get :new
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'redirects post requests for create to sign_in' do
      post :create
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'redirects patch requests for activate to sign_in' do
      patch :activate, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'redirects patch requests for deactivate to sign_in' do
      patch :deactivate, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'redirects get requests for edit to sign_in' do
      get :edit, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'redirects patch requests for update to sign_in' do
      patch :update, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'redirects put requests for update to sign_in' do
      put :update, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'redirects delete requests for destroy to sign_in' do
      delete :destroy, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  context 'organization users' do
    before do
      #TODO - auth error
      org_usr = build(:user, :organization)
      allow(request.env['warden']).to receive(:authenticate!).and_return(org_usr)
      allow(controller).to receive(:current_user).and_return(org_usr)
    end
    it 'redirects get requests to index to dashboard' do
      get :index
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects get requests to show to dashboard' do
      get :show, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects get requests to new to dashboard' do
      get :new
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects post requests to create to dashboard' do
      post :create
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects patch requests to activate to dashboard' do
      patch :activate, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects patch requests to deactivate to dashboard' do
      patch :deactivate, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects get requests to edit to dashboard' do
      get :edit, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects patch requests to update to dashboard' do
      patch :update, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects put requests to update to dashboard' do
      put :update, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'redirects delete requests to destroy to dashboard' do
      delete :destroy, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
  end


end
