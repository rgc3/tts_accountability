class Goal < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>', navpic: '50X50' }, default_url: '/images/:style/missing.png'
  belongs_to :user
  
  validates :description, presence: true
end


