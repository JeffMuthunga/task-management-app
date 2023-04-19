class UserTask < ApplicationRecord
    acts_as_paranoid

    belongs_to :user
    belongs_to :task
    belongs_to :status
end
