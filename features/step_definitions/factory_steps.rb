Given(/^the following ChatRooms has been created$/) do |table|
  table.hashes.each do |room|
    FactoryBot.create(:chat_room, room)
  end
  binding.pry
end