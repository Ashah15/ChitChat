require 'rails_helper'

RSpec.describe 'User logs in', type: :feature do
  before :each do
    User.create(name: 'lorena', username: 'lorena', email: 'lorena@gmail.com')
  end

  scenario 'with blank username' do
    login_with ''

    expect(page).to have_content('Log in')
  end

  scenario 'with wrong username' do
    login_with 'rojas'

    expect(page).to have_content('Log in')
  end

  scenario 'with correct username' do
    login_with 'lorena'

    expect(page).to have_content('Log out')

    click_on 'Log out'

    expect(page).to have_content('Log in')
  end

  def login_with(name)
    visit login_path
    fill_in 'session_username', with: name
    click_button 'Log in'
  end
end
