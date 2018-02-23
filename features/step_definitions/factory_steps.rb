Given(/^the following ChatRooms (?:has been created|exist)$/) do |table|
  table.hashes.each do |room|
    FactoryBot.create(:chat_room, room)
  end
end