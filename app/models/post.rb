class Post < ApplicationRecord
  belongs_to :u_ser
  validates :text, presence: true
  has_many :comment
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
