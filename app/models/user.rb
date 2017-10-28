class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  acts_as_voter
  has_many :connector_relationships, foreign_key: :connecting_id, class_name: 'Conn'
  has_many :connectors, through: :connector_relationships, source: :connector
  has_many :connecting_relationships, foreign_key: :connector_id, class_name: 'Conn'
  has_many :connecting, through: :connecting_relationships, source: :connecting
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }

  has_attached_file :avatar, styles: { medium: '152x152#'}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
