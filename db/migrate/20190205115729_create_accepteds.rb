class CreateAccepteds < ActiveRecord::Migration[5.1]
  def change
    create_table :accepteds do |t|
      t.integer :sid
      t.integer :rid

      t.timestamps
    end
  end
end
