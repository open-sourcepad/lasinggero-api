class CreateAuthenticationTokens < ActiveRecord::Migration
  def change
    create_table :authentication_tokens do |t|
      t.string :name
      t.string :device_token
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
