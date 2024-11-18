class MuscleGroup < ApplicationRecord
  has_many :exercises, dependent: :destroy
  has_many :routine_muscle_groups, dependent: :destroy
  has_many :routines, through: :routine_muscle_groups

  validates :name, presence: true, uniqueness: true
end
