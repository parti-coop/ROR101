class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  mount_uploader :featured, ImageUploader
  has_many :comments, as: :commentable, dependent: :destroy
end
