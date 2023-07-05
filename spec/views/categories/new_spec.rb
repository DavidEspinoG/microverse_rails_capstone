require 'rails_helper'

RSpec.describe 'new category view', type: :system do
  let!(:user) { User.create name: 'David', email: 'cons@mail.com', password: 'password' }

  context 'When the user creates a category' do
    it 'should redirect to categories page' do
      login_as(user, scope: :user)
      visit new_category_path
      fill_in 'Category name', with: 'Foxes'
      choose 'icon_1'
      click_on 'Save'
      expect(page).to have_current_path(categories_path)
    end
    it 'should redirect to categories page' do
      login_as(user, scope: :user)
      visit new_category_path
      fill_in 'Category name', with: 'Foxes'
      choose 'icon_1'
      click_on 'Save'
      expect(page).to have_content('Foxes')
    end
  end
end
