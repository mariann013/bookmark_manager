require 'spec_helper'
require_relative 'web_helpers'

feature 'Creating Tags' do
  scenario 'create tag' do
    create_link
    fill_in :tag, with: 'Search'
    click_button 'Submit'
    # link = Link.first
    expect(Link.first.tags.map(&:name)*"").to eq('Search')
  end
end
