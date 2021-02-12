require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  context 'unauthenticated users' do
    it 'are redirected unauthenticated requests for index to the sign_in screen' do
      get :index
      expect(response).to redirect_to(new_user_session_url)
    end
  end
end
