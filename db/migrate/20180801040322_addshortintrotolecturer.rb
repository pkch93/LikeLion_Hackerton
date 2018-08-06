class Addshortintrotolecturer < ActiveRecord::Migration
  def change
    add_column :lecturers, :shortintro, :string
  end
end
