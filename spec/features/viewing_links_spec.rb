require "spec_helper.rb"

feature "to view links" do

  scenario "view links on homepage" do
    visit '/links'
    Link.create(:url => "http://www.google.com", :title => "Google")
    visit '/links'
    within "ul#links" do
      expect(page).to have_content "Google"
    end
  end
end
