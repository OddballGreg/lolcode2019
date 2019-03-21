class Solution < ApplicationRecord
  belongs_to :problem_set
  belongs_to :user
  has_one_attached :file
  has_one_attached :program

  after_create :save_score

  private
  def save_score
    self.score = Scorer.test(problem_set.file.download, file.download)
    self.save
  end
end
