require 'rails_helper'

RSpec.describe 'operations', type: :system do 
  let!(:user) { User.create name: 'Alejandra', email: 'ale@mail.com', password: 'password' }
  let!(:category) { Category.create name: 'Cats', icon: '1', user: user }
  let!(:operation) { Operation.create name: 'Hair cut', amount: 80, author: user }
  it 'should render the name of the operation' do 
    operation.categories << category
    login_as(user, scope: :user)
    visit category_operations_path(category)
    expect(page).to have_content(operation.name)
  end
  it 'should render the total amount of the category' do 
    operation.categories << category
    login_as(user, scope: :user)
    visit category_operations_path(category)
    expect(page).to have_content(operation.amount)
  end
end