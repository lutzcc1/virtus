class Set < ApplicationRecord
  belongs_to :routine
  belongs_to :exercise

  validates :reps_goal, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :total_reps, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
