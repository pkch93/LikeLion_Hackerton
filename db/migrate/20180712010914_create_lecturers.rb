class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :lec_id, null: false
      t.string :pw, null: false
      t.string :name
      t.string :sex # 남 or 여 선택하는 checkbox 생성
      t.integer :age
      t.integer :career
      t.string :phone
      t.string :email
      t.string :region # select박스를 통해 선택하도록...
      t.text :intro
      t.string :lec_img # 강사 포스터 저장, file 형식으로 저장
      
      t.timestamps null: false
    end
    add_index :lecturers, :lec_id, unique: true # index 생성
  end
end
