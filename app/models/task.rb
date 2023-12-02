class Task < ApplicationRecord
    validates :task_name, presence: true
    validates :category_id, presence: true
    validates :deadline, presence: true
    validates :status, presence: true
    belongs_to :category
    has_many :task
end
