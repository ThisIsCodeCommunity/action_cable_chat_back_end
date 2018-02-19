Then(/^(?:he|she) should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end


Then(/^she should see a chat window$/) do
  expect(page).to have_selector 'textarea', id: 'general-chat'
end

And(/^she should see a message input field$/) do
  expect(page).to have_selector 'input', id: 'message'
end

And(/^she should see a "([^"]*)" button$/) do |arg|
  expect(page).to have_selector 'input[type="submit"'
end