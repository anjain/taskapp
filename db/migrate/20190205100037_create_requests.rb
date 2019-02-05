class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :cid
      t.integer :uid

      t.timestamps
    end
  end
end
