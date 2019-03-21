class Solution < ApplicationRecord
  belongs_to :problem_set
  belongs_to :user
  has_one_attached :file
  has_one_attached :program

  after_create :save_score

  private
  def save_score
    result = Scorer.test(problem_set.file.download, file.download)
    if result.class == Integer
      self.score = result 
    else
      self.score = -42
      self.error = result
    end
    self.save
  end
end
