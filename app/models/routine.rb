class Routine < ApplicationRecord
  belongs_to :user
  belongs_to :template, class_name: "Routine", optional: true
  has_many :routine_exercises, dependent: :destroy
  has_many :exercises, through: :routine_exercises
  has_many :routine_muscle_groups, dependent: :destroy
  has_many :muscle_groups, through: :routine_muscle_groups
  has_many :sets, dependent: :destroy

  validates :name, presence: true
  validates :type, presence: true
end
