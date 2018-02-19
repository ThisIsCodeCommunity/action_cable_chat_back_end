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