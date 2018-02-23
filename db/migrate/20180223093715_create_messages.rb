class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :body
      t.references :chat_room, foreign_key: true

      t.timestamps
    end
  end
end
