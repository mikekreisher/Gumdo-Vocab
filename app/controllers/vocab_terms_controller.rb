class VocabTermsController < ApplicationController
  def index
    @vocab_terms = VocabTerm.all
    
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @vocab_terms }
    end
  end
  
  def create
    @vocab_term = VocabTerm.new(params[:post])
 
    respond_to do |format|
      if @vocab_term.save
        format.html  { redirect_to(@vocab_term,
                      :notice => 'Term was successfully created.') }
        format.json  { render :json => @vocab_term,
                      :status => :created, :location => @vocab_term }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @vocab_term.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def new
    @vocab_term = VocabTerm.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @vocab_term}
    end
  end
  
  def edit
    @vocab_term = VocabTerm.find(params[:id])
  end
  
  def show
    @vocab_term = VocabTerm.find(params[:id])
 
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @vocab_term }
    end
  end
  
  def update
    @vocab_term = VocabTerm.find(params[:id])
 
    respond_to do |format|
      if @vocab_term.update_attributes(params[:vocab_term])
        format.html  { redirect_to(@vocab_term,
                      :notice => 'Term was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @vocab_term.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
end
