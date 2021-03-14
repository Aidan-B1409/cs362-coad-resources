require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

    describe 'full_title' do
      it 'has a default title' do
        expect(helper.full_title('')).to eq('Disaster Resource Network')
      end
      it 'appends the given title to the default title' do
        expect(helper.full_title('yeet')).to eq('yeet | Disaster Resource Network')
      end
    end
end
