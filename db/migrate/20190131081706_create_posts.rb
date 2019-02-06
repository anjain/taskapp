class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :text
      t.title :string
      t.references :u_ser, foreign_key: true

      t.timestamps
    end
  end
end
