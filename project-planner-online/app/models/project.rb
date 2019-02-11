class Project < ActiveRecord::Base
  
    has_many :tasks
    has_many :assignments
    has_many :users, through: :assignments
    validates :name, presence: true
    validates :description, length: { maximum: 7000 }

end
