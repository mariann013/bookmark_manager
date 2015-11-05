def create_link
  visit '/'
  click_button 'New bookmark'
  fill_in :url, with: 'http://www.facebook.com'
  fill_in :title, with: 'Facebook'
  click_button 'Submit'
end
