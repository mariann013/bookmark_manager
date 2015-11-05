require 'spec_helper'
require_relative 'web_helpers'

feature 'showing correctly tagged links' do
  scenario 'show tagged links' do
    creat_link
    fill_in :tag, with: 'Search'
    click_button 'Submit'
    click_button 'New bookmark'
  end
end
