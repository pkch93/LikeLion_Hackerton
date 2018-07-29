class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :sex
      t.integer :age
      t.text :background
      t.integer :point
      t.boolean :recommend
      t.text :content
      t.references :lecture
      
      t.timestamps null: false
    end
  end
end
