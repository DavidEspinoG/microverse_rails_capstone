require 'rails_helper'

RSpec.describe Operation, type: :model do
  let!(:user) { User.create name: 'David', email: 'david@mail.com', password: 'password' }
  let!(:wrong_operation) {Operation.create amount: 12}
  context 'Operation without name' do 
    it 'should be incorrect' do
      expect(wrong_operation).not_to be_valid
    end
  end
end
