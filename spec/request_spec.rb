require 'rails_helper'

RSpec.describe ChatRoomsController, type: :request do
  describe 'GET /' do
    context 'return 1 chat room' do
      let!(:chat_room) {FactoryBot.create(:chat_room, host: 'Oliver', title: 'General Chat')}
      let(:headers) {{HTTP_ACCEPT: 'application/json'}}

      it 'should return a chat room' do
        get '/', headers: headers

        # binding.pry
        response_json = JSON.parse(response.body)
        expect(response).to have_http_status(:ok)
        expect(response.status).to eq 200
        expected_response = {id: 1, host: 'Oliver', title: 'General Chat'}
        expect(response_json).to eq expected_response.as_json
      end
    end
  end
end