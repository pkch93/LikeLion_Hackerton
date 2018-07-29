class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :title
      t.text :intro
      t.date :time
      t.string :subject
      t.integer :rate # 선택 상자로 선택하도록
      t.string :lec_poster # 강연 포스터 저장
      t.references :lecturer
      
      t.timestamps null: false
    end
  end
end
