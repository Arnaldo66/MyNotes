class AddUserToNotes < ActiveRecord::Migration[5.0]
  def change
  	change_table :notes do |t|
  		t.references :user, foreign_key: true, index: true
  	end
  end
 end