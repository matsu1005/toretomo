class Plan < ApplicationRecord

  belongs_to :user

  validates :title, presence: true, length: {maximum: 75}
  validates :detail, presence: true
  validates :start_ymd, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :event_cls, presence: true
  validates :train_strength, presence: true
  validates :place, presence: true, length: {maximum: 50}
  validates :prefecture, presence: true
  validates :join_limit, presence: true, numericality: {less_than: 20}

end
