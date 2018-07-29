class CreateLecturerCategories < ActiveRecord::Migration
  def change
    create_table :lecturer_categories do |t|
      t.string :category
      t.references :lecturer
      
      t.timestamps null: false
    end
  end
end
