def create_link
  visit '/'
  click_button 'Sign in'
  click_button 'New bookmark'
  fill_in :url, with: 'http://www.facebook.com'
  fill_in :title, with: 'Facebook'
end
