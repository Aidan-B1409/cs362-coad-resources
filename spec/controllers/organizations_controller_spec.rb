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
    # TODO - no such method? 
    it 'are redirected unauthenticated delete requests to the sign_in screen' do
      delete :destroy, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  context 'organization users' do
    before do
      # TODO - Need help here, users not authenticating
      org_user = build(:user, :organization)
      allow(request.env['warden']).to receive(:authenticate!).and_return(org_user)
      allow(controller).to receive(:current_user).and_return(org_user)
    end

    it 'Redirects post requests for approve to sign_in' do
      post :approve, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end
    it 'Redirects post requests for reject to sign_in' do
      post :reject, params: { id: 'fake' }
      expect(response).to redirect_to(dashboard_url)
    end

    it 'Allows get requests to index' do
      get :index
      expect(response).to be_successful
    end
    it 'Allows get requests to show' do
      get :show, params: { id: 'fake' }
      expect(response).to be_successful
    end
    it 'Allows get requests to new' do
      get :new
      expect(response).to be_successful
    end
    it 'Allows post requests to create' do
      post :create
      expect(response).to be_successful
    end
    it 'Allows get requests to edit' do
      get :edit, params: { id: 'fake' }
      expect(response).to be_successful
    end
    it 'Allows patch requests to update' do
      patch :update, params: { id: 'fake' }
      expect(response).to be_successful
    end
    it 'Allows put requests to update' do
      put :update, params: { id: 'fake' }
      expect(response).to be_successful
    end
  end
  
  context 'admin users' do
    before do
      # TODO - Need help here, users not authenticating
      admin_usr = build(:user, :admin)
      allow(request.env['warden']).to receive(:authenticate!).and_return(admin_usr)
      allow(controller).to receive(:current_user).and_return(admin_usr)
    end

    it 'Allows post requests to approve' do
      post :approve, params: { id: 'fake' }
      expect(response).to be_successful
    end
    it 'Allows post requests to reject' do
      post :reject, params: { id: 'fake' }
      expect(response).to be_successful
    end

    it 'Allows get requests to index' do
      get :index
      expect(response).to be_successful
    end
    it 'Allows get requests to show' do
      get :show, params: { id: 'fake' }
      expect(response).to be_successful
    end
    it 'Allows get requests to new' do
      get :new
      expect(response).to be_successful
    end
    it 'Allows post requests to create' do
      post :create
      expect(response).to be_successful
    end
    it 'Allows get requests to edit' do
      get :edit, params: { id: 'fake' }
      expect(response).to be_successful
    end
    it 'Allows patch requests to update' do
      patch :update, params: { id: 'fake' }
      expect(response).to be_successful
    end
    it 'Allows put requests to update' do
      put :update, params: { id: 'fake' }
      expect(response).to be_successful
    end
  end
end
