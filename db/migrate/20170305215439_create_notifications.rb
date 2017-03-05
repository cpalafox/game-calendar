class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.string :raw_game
      t.date :reminder_date
      t.date :anticipation_reminder

      t.timestamps
    end
  end
end