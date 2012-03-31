class GumdoVocabularyController < ApplicationController
  def index
    
  end
  
  def start_game
    @questions_total = 10
    @question_count = 1
    @terms = VocabTerm.all.shuffle.sample(@questions_total)
    @english_terms = VocabTerm.select("id, english");
    render 'game'
  end
  
  def check_answer
    
  end
  
  def next_question
    #@question_count += 1
    render 'game'
  end

end
