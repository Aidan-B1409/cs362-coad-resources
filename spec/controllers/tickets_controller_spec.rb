require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  context 'unauthenticated users' do
    # TODO - should capture and release be protected? 
    # it 'redirects unauthenticated post requests for capture to the sign_in screen' do
    #   post :capture, params: { id: 'fake' }
    #   expect(response).to redirect_to(new_user_session_url)
    # end
    # it 'redirects unauthenticated post requests for release to the sign_in screen' do
    #   post :release, params: { id: 'fake' }
    #   expect(response).to redirect_to(new_user_session_url)
    # end
    # TODO - Should close be protected?
    it 'redirects unauthenticated delete requests to the sign_in screen' do
      delete :destroy, params: { id: 'fake' }
      expect(response).to redirect_to(new_user_session_url)
    end
  end

end
