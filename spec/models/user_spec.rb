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
  it 'should assign a default role to a user if one has not been assigned already' do
    usr = user
    usr.set_default_role
    expect(usr.role).to eq('organization')
    usr.role = :admin
    usr.set_default_role
    expect(usr.role).to eq('admin')
  end

end
