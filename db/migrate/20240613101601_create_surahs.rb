class CreateSurahs < ActiveRecord::Migration[7.1]
  def change
    create_table :surahs do |t|
      t.integer :serial_number
      t.string :name
      t.string :place_of_revealed
      t.integer :verses
      t.integer :recited
      t.integer :due
      t.string :status
      t.integer :full_recite_count
      t.datetime :starting_date
      t.datetime :completion_date

      t.timestamps
    end
  end
end
