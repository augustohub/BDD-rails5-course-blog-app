require 'rails_helper'

RSpec.feature 'SignUp Users' do
  scenario 'with valid credentials' do
    visit '/'
    click_link 'Sign Up'

    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'secret_pass'
    fill_in 'Password confirmation', with: 'secret_pass'

    click_button 'Sign Up'

    expect(page).to have_content('You have sign up successfully.')
  end

  scenario 'with invalid credentials' do
    visit '/'
    click_link 'Sign Up'

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''

    click_button 'Sign Up'

    expect(page).to have_content('You have not sign up successfully.')
  end
end
