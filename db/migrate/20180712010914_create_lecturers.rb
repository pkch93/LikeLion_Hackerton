class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers, {:id => false} do |t|
      t.string :lec_id
      t.string :pw
      t.string :name
      t.string :sex
      t.integer :age
      t.integer :career
      t.string :phone
      t.string :email
      t.string :region
      t.text :intro

      t.timestamps null: false
    end
  end
end
