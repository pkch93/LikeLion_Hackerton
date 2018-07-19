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
      t.string :lec_img # 강사 포스터 저장, 아직은 aws 열지 않음

      t.timestamps null: false
    end
  end
end
