class Game < ActiveRecord::Base
  serialize :questions, Array
  serialize :answers, Array
end
