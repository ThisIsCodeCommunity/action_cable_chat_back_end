require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  it {is_expected.to have_db_column :id}
  it {is_expected.to have_db_column :title}
  it {is_expected.to have_db_column :host}

  it {is_expected.to have_many :messages}


  it 'has a valid Factory' do
    expect(FactoryBot.build(:chat_room)).to be_valid
  end

end
