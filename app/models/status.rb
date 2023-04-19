class Status < ApplicationRecord
    acts_as_paranoid

    has_many :tasks
    has_many :user_tasks
end
