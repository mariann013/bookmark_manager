require 'spec_helper'

feature 'Form to submit a new link' do

  scenario 'When we want to create a new link' do
    visit '/'
    click_button 'New bookmark'
    fill_in :url, with: 'http://www.facebook.com'
    fill_in :title, with: 'Facebook'
    click_button 'Submit'
    within('ul#links') do
      expect(page).to have_content 'Facebook'
    end
  end
end
