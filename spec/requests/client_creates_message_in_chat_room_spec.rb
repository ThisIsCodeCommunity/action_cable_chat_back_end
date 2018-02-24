require 'rails_helper'

RSpec.describe MessagesController, type: :request do

  let!(:chat_room) {FactoryBot.create(:chat_room, title: 'My Room')}

  it 'POST /chat_rooms/:chat_room_id/messages' do
    post "/chat_rooms/#{chat_room.id}/messages",
         params: {message: {body: 'test', sender: 'Thomas'}},
         headers: {HTTP_ACCEPT: 'application/json'}
    expect(response.body).to eq ({message: 'Your message was sent...'}).to_json
  end
end