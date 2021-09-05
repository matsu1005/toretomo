class Message < ApplicationRecord
  validates :user_id, presence: true
  validates :plan_id, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :plan
end
