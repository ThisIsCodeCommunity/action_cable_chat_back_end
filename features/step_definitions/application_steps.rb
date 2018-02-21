Given(/^a user (?:visit|visits) the site$/) do
  visit root_path
  binding.pry
end

And(/^she fills in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

And(/^she selects "([^"]*)" from "([^"]*)"$/) do |room_name, selector|
  select room_name, from: selector.gsub(' ', '').underscore
end

And(/^she clicks on "([^"]*)"$/) do |text|
  click_link_or_button text
end

Then(/^show me the page$/) do
  save_and_open_page
end

Given(/^all session cookies are cleared$/) do
  @session = page.driver.browser.manage
  @session.delete_all_cookies
end

Then(/^there should be a session cookie set to "([^"]*)"$/) do |name|
  cookie_value = @session.cookie_named('nickname')[:value]
  expect(cookie_value).to eq name
end

