require 'rails_helper'

RSpec.describe Operation, type: :model do
  let!(:user) { User.create name: 'David', email: 'david@mail.com', password: 'password' }
  let!(:wrong_operation) { Operation.create amount: 12 }
  let!(:correct_operation) { Operation.create amount: 12, name: 'Laptop', author: user }
  context 'Operation without name' do
    it 'should be invalid' do
      expect(wrong_operation).not_to be_valid
    end
  end
  context 'Correct operation ' do
    it 'should be valid' do
      expect(correct_operation).to be_valid
    end
  end
end
