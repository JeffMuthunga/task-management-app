class Task < ApplicationRecord
    acts_as_paranoid
    
    belongs_to :status
    has_many :user_tasks
    has_many :users, through: :user_tasks
end
