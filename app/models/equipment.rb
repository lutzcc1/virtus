class Equipment < ApplicationRecord
  has_many :exercises, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
