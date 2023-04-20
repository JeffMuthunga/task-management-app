class User < ApplicationRecord
    acts_as_paranoid
    has_secure_password
    
    has_many :user_tasks
    has_many :tasks, through: :user_tasks
end
