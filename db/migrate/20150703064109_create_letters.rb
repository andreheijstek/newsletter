class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.text :welcome
      t.date :date
      t.time :time1
      t.time :time2
      t.text :announcements
      t.text :liturgy

      t.timestamps null: false
    end
  end
end
