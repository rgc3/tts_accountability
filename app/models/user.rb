class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>', navpic: '50X50' }, default_url: '/images/:style/missing.png'

  has_many :goals
  has_many :relationships
  has_many :friends, through: :relationships
end
