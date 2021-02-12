require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  context 'unauthenticated users' do
    it 'are redirected unauthenticated requests for index to the sign_in screen' do
      get :index
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'are redirected unauthenticated requests for show to the sign_in screen' do
      get :show, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'are redirected unauthenticated requests for new to the sign_in screen' do
      get :new
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'are redirected unauthenticated post requests for create to the sign_in screen' do
      post :create
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'are redirected unauthenticated post requests for approval to the sign_in screen' do
      post :approve, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'are redirected unauthenticated post requests for rejection to the sign_in screen' do
      post :reject, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'are redirected unauthenticated get requests for edit to the sign_in screen' do
      get :edit, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'are redirected unauthenticated patch requests for update to the sign_in screen' do
      patch :update, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    it 'are redirected unauthenticated put requests for update to the sign_in screen' do
      put :update, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
    # TODO - no such method? 
    # it 'are redirected unauthenticated delete requests to the sign_in screen' do
    #   delete :destroy, params: { id: 'fake' }
    #   expect(response).to redirect_to(new_user_session_url)
    # end
  end

end
