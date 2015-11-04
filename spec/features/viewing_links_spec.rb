require "spec_helper.rb"

feature "to view links" do

  scenario "view links on homepage" do
    Link.create(:url => "http://www.google.com", :title => "Google")
    visit "/"
    within "ul#links" do
      expect(page).to have_content "Google"
    end
  end

end
