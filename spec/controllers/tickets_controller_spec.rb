require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  context 'unauthenticated users' do
    before do
      org_usr = build(:user, :organization)
      allow(request.env['warden']).to receive(:authenticate!).and_return(org_usr)
      allow(controller).to receive(:current_user).and_return(org_usr)
    end
    it 'allows post requests to create' do
      post :create
      expect(response).to be_successful
    end
    it 'allows get requests to new' do
      get :new
      expect(response).to be_successful
    end
    it 'redirects get requests for show to sign_in' do
      get :show, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
  end

end
