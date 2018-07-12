class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :title
      t.text :intro
      t.date :time
      t.string :subject
      t.integer :rate

      t.timestamps null: false
    end
  end
end
