class Plan < ApplicationRecord

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

  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :join_users, through: :joins, source: :user

end
