# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :icon, ImageUploader

  validates :name, presence: true, uniqueness: true, length: {maximum: 15}

  has_many :plan, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :planjoin, through: :joins, source: :plan

  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy, inverse_of: :follow
  has_many :followers, through: :reverses_of_relationship, source: :user

  has_many :message, dependent: :destroy

  def follow(other_user)
    self.relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship&.destroy if relationship
  end

end
