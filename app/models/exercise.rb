class Exercise < ApplicationRecord
  belongs_to :muscle_group
  belongs_to :equipment
  has_many :routine_exercises, dependent: :destroy
  has_many :routines, through: :routine_exercises
  has_many :sets, dependent: :destroy, class_name: "ExerciseSet"

  validates :name, presence: true, uniqueness: true
end
