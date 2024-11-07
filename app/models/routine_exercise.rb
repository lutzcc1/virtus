class RoutineExercise < ApplicationRecord
  belongs_to :routine
  belongs_to :exercise

  validates :routine, uniqueness: { scope: :exercise }
end
