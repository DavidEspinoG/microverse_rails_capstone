require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:user) { User.create name: 'David', email: 'david@mail.com', password: 'password' }
  let!(:correct_category) { Category.create name: 'category', icon: 1, user: }
  let!(:wrong_category) { Category.create icon: 1, user: }

  context 'Correct category' do
    it 'should be valid' do
      expect(correct_category).to be_valid
    end
  end
  context 'Category without name' do
    it 'should be invalid' do
      expect(wrong_category).not_to be_valid
    end
  end
end
