class Post < ApplicationRecord
  belongs_to :u_ser
  validates :text, presence: true
end
