require 'rails_helper'

RSpec.describe 'User create comments', type: :feature do
  before :each do
    User.create(name: 'lorena', username: 'lorena', email: 'lorena@gmail.com')
  end

  scenario 'has comment button' do
    login_with 'lorena'
    visit comments_path
    expect(page).to have_content('Twitter')
  end

  scenario 'has incorrect log_in details' do
    login_with 'rojas'
    expect(page).to have_content("Log in\nUsername Remember me on this computer\nNew to Twitter? Sign up now!")
  end

  def login_with(name)
    visit login_path
    fill_in 'session_username', with: name
    click_button 'Log in'
  end
end
