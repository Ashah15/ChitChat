require 'rails_helper'

RSpec.describe 'Visitor signs up', type: :feature do
  scenario 'with valid email and name' do
    sign_up_with 'lorena@gmail.com', 'lorena', 'lorena'

    expect(page).to have_content('Log out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'lorena', 'lorena'

    expect(page).to have_content('Log in!')
  end



  scenario 'with blank username' do
    sign_up_with 'valid@example.com', 'lorena', ''
    expect(page).to have_content('Log in!')
  end

  def sign_up_with(email, name, username)
    visit signup_path
    fill_in 'user_name', with: name
    fill_in 'user_username', with: username
    fill_in 'user_email', with: email
    click_button 'Sign Up'
  end
end