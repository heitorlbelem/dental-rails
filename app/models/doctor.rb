class Doctor < ApplicationRecord
  validates :name, :expertise, presence: true
end
