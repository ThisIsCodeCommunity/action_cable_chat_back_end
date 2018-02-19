Given(/^a user (?:visit|visits) the site$/) do
  visit root_path
end


And(/^she fills in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end


And(/^she selects "([^"]*)" from "([^"]*)"$/) do |room_name, selector|
  #room = Room.find_by(name: room_name)
  select room_name, from: selector
end

And(/^she clicks on "([^"]*)"$/) do |text|
  click_link_or_button text
end

Then(/^show me the page$/) do
  save_and_open_page
end