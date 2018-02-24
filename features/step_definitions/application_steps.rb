Given(/^a user (?:visit|visits) the site$/) do
  visit  root_path
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

Then(/^there is nick saved "([^"]*)"$/) do |name|
  page.driver.browser.manage.add_cookie(name: 'nickname', value: name)
end


And(/^the user is on the "([^"]*)" page$/) do |chat_room_title|
  chat_room = ChatRoom.find_by(title: chat_room_title)
  visit chat_room_path(chat_room)
end

Given(/^(?:she|he) switch to a new window$/) do
  window = open_new_window
  switch_to_window(window)
end