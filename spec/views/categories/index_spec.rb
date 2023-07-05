require 'rails_helper'

RSpec.describe 'categories view', type: :system do
  let!(:user) { User.create name: 'David', email: 'cons@mail.com', password: 'password' }
  let!(:user_two) { User.create name: 'David', email: 'david@mail.com', password: 'password' }
  let!(:category) { Category.create name: 'Cats', icon: '1', user: user }
  let!(:category_two) { Category.create name: 'Dogs', icon: '1', user: user_two }

  it 'should render the name of user category' do
    login_as(user, scope: :user)
    visit categories_path
    expect(page).to have_content(category.name)
  end

  it 'should not render the name of another user category' do
    login_as(user, scope: :user)
    visit categories_path
    expect(page).not_to have_content(category_two.name)
  end
end
