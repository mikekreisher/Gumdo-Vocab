class Game < ActiveRecord::Base
  serialize :questions, Array
  serialize :answers, Array
  serialize :categories, Array
  
  def is_easy?
    self.difficulty == "easy"
  end
end
