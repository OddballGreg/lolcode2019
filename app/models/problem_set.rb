class ProblemSet < ApplicationRecord
  has_one_attached :file
  has_many :solutions, dependent: :destroy
end
