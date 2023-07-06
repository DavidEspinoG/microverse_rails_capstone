require 'rails_helper'

RSpec.describe 'Home page', type: :system do
  let!(:user) { User.create name: 'David', email: 'david@mail.com', password: 'password' }
  it 'should render the title of the page' do
    visit root_path
    expect(page).to have_content('Budget App')
  end
  it 'should render the Sign up link' do
    visit root_path
    expect(page).to have_link('Sign up')
  end
  it 'should render log in link' do
    visit root_path
    expect(page).to have_link('Log in')
  end
end
