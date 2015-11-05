require 'spec_helper'

feature 'Creating Tags' do
  scenario 'create tag' do
    create_link
    click_button 'Add tag'
    fill_in :tag, with: 'Social Media'
    click_button 'Done'
    expect(page).to have_content 'Social Media'
  end
end
