class AddAttachmentAvatarToUSers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :u_sers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :u_sers, :avatar
  end
end
