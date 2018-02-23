require 'rails_helper'

RSpec.describe Message, type: :model do
  it {is_expected.to have_db_column :id}
  it {is_expected.to have_db_column :body}
  it {is_expected.to have_db_column :sender}

  it {is_expected.to belong_to :chat_room}

  it 'has a valid Factory' do
    expect(FactoryBot.build(:message)).to be_valid
  end
end
