class RoutineMuscleGroup < ApplicationRecord
  belongs_to :routine
  belongs_to :muscle_group

  validates :routine, uniqueness: { scope: :muscle_group }
end
