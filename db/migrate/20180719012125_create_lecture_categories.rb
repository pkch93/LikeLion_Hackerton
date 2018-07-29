class CreateLectureCategories < ActiveRecord::Migration
  def change
    create_table :lecture_categories do |t|
      t.string :lec_category
      t.references :lecture
      
      t.timestamps null: false
    end
  end
end
