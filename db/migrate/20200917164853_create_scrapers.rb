class CreateScrapers < ActiveRecord::Migration[5.2]
  def change
    create_table :scrapers do |t|
      t.string :month
      t.string :daily_s
      t.string :daily_e
      t.string :count
      t.timestamps
    end
  end
end
