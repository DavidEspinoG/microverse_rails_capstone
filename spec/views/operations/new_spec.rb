require 'rails_helper'

RSpec.describe 'operations', type: :system do
  let!(:user) { User.create name: 'Alejandra', email: 'ale@mail.com', password: 'password' }
  let!(:category) { Category.create name: 'Cats', icon: '1', user: }

  it 'should render a checkbox with the name of the category' do
    login_as(user, scope: :user)
    visit new_category_operation_path(category)
    expect(page).to have_content(category.name)
    expect(page).to have_selector("#category_#{category.id}")
  end
  it 'should render a checkbox with the correct id' do
    login_as(user, scope: :user)
    visit new_category_operation_path(category)
    expect(page).to have_selector("#category_#{category.id}")
  end

  context 'When the user creates an operation' do
    it 'should redirect to operation#index' do
      login_as(user, scope: :user)
      visit new_category_operation_path(category)
      fill_in 'Name', with: 'iPhone'
      fill_in 'Amount', with: '10'
      check "category_#{category.id}"
      click_on 'Save'
      expect(page).to have_current_path(category_operations_path(category))
    end
  end
end
