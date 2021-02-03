require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new}
  it 'has an email' do
    expect(user).to respond_to(:email)
  end

  it 'has a role' do
    expect(user).to respond_to(:role)
  end

  describe 'assosciations' do
    it { should belong_to(:organization).class_name('Organization').optional }
  end

  #Member functions
  describe 'set_default_role' do
    it 'should assign a default role to a user' do
      user.role = nil
      user.set_default_role
      expect(user.role).to eq('organization')
    end

    it 'it does not change the existing role of a user' do
      user.role = :admin
      user.set_default_role
      expect(user.role).to eq('admin')
    end
  end
end
