class User < ActiveRecord::Base
  
  has_many :tasks
  has_many :assignments
  has_many :projects, through: :assignments
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

end
