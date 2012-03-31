class GamesController < ApplicationController
  
  def create
    @game = Game.new
    @game.questions = Array.new
    @game.answers = Array.new
    @questions_total = 10
    
    VocabTerm.all.shuffle.sample(@questions_total).each do |term|
      @game.questions << term.id
    end
    
    respond_to do |format|
      if @game.save
        format.html {redirect_to(@game)}
      end
    end
  end
  
  def new
  end
  
  def show
    @game = Game.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end
  
  def get_question
    @game = Game.find(params[:id])
    @vocab_id = @game.questions[params[:number].to_i - 1]
    @vocab = VocabTerm.find @vocab_id if !@vocab_id.nil?
    
    respond_to do |format|
      if !@vocab_id.nil?
        format.js
      else
        format.js {render "summary"}
      end
    end
  end
  
  def check_answer
    @game = Game.find(params[:id])
    @vocab_id = @game.questions[params[:number].to_i - 1]
    
    respond_to do |format|
      if(@vocab_id.to_s == params[:answer])
        @game.answers[params[:number].to_i - 1] = 1
        @game.save
        format.html {render :text => "correct"}
      else
        @game.answers[params[:number].to_i - 1] = 0
        @game.save
        format.html {render :text => @vocab_id.to_s}
      end
    end
  end
end
