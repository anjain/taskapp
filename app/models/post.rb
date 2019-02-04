class Post < ApplicationRecord
  belongs_to :u_ser
  validates :text, presence: true
  has_many :comment

end
