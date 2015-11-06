require "spec_helper.rb"

feature "registering as new user" do

  scenario "registration form" do
    visit '/'
    click_button 'Register'
    expect(page).to have_content 'Register here'
  end

before(:each) do
  visit '/'
  click_button 'Register'
  fill_in :username, with: 'Bob123'
  fill_in :email, with: 'bobrules@email.com'
  fill_in :password, with: 'password'
  click_button 'Submit'
end

scenario "user count increaees by 1" do
  expect(page).to have_content 'User Count:1'
end

scenario "welcome message for new user" do
  expect(page).to have_content "Welcome to Bookmark Manager, Bob123"
end
end
