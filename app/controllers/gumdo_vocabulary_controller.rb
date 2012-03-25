class GumdoVocabularyController < ApplicationController
  def index
    
  end
  
  def start_game
    @terms = VocabTerm.all.shuffle.sample(3)
    @english_terms = VocabTerm.select("english");
    render 'game'
  end

end
