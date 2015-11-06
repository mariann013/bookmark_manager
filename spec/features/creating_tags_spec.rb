require 'spec_helper'
require_relative 'web_helpers'

feature 'Creating Tags' do
  scenario 'create tag' do
    visit '/links'
    create_link
    fill_in :tag, with: 'Search'
    click_button 'Submit'
    # link = Link.first
    expect(Link.first.tags.map(&:name)*"").to eq('Search')
  end
end
feature 'Adding multiple tags' do
  scenario 'add more than one tag' do
    visit '/links'
    create_link
    fill_in :tag, with: 'Search Homepage'
    click_button 'Submit'
    expect(Link.first.tags.map(&:name)).to include("Search", "Homepage")
  end
end
