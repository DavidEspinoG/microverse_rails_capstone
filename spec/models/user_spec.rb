require 'rails_helper'

RSpec.describe User, type: :model do
  let(:correct_user) { User.create name: 'Constanza', email: 'cons@mail.com', password: 'password' }
  let(:invalid_user) { User.create email: 'david@mail.com', password: 'password' }
  let(:invalid_user_two) { User.create name: 'david', password: 'password' }

  it 'should be valid if all the required data is given' do
    expect(correct_user).to be_valid
  end
  it 'should be invalid if the name is not given' do
    expect(invalid_user).not_to be_valid
  end
  it 'should be invalid if the email is not given' do
    expect(invalid_user_two).not_to be_valid
  end
end
