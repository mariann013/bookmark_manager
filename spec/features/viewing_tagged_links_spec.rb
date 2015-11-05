require 'spec_helper'
require_relative 'web_helpers'

feature 'showing correctly tagged links' do
  scenario 'show tagged links' do
    visit '/'
    click_button 'New bookmark'
    fill_in :url, with: 'bubbles.com'
    fill_in :title, with: 'bubbles world'
    fill_in :tag, with: 'bubbles'
    click_button 'Submit'
    click_button 'Search tags'
    fill_in :tags, with: 'bubbles'
    click_button 'Submit'
    expect(page).to have_content 'bubbles.com'
  end
end
