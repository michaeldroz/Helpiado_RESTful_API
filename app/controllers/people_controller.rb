class PeopleController < ApplicationController
  #Tomorrow to do: Design vote_balance models
  before_action :set_person, only: [:show, :edit, :update, :destroy]   
  @person_params_with_vote_balance = person_params.merge(vote_balances_attributes: {:vote_balance =>50})
  # GET /people
  # GET /people.json  h
  # How to merge vote_balance for each..probably a do |x| .. 
  def index  
     @people = Person.all
     render json: @people
     puts "get people from index"
  end

  # GET /people/1
  # GET /people/1.json
   def show
    @person = Person.find(params[:id])
    @vote_balance = VoteBalance.find_by(:person_id =>@person.id)
    render :json => @person.attributes.merge(@vote_balance.attributes)
    #The below code results in the Double Render Error. Can only do one action at a time in RoR
    #render json: @person
    #render json: @vote_balance
    puts "get person from show"
  end

  # POST /people
  # POST /people.json
  # How to include vote_balance for all people
  def new
     @person = Person.new(person_params)
     if @person.save
       puts "person created at new"
       render json: @person, status: :created, location: @person
        #logging where the person request is going
     else
       render json: @person.errors, status: :unprocessable_entity
     end 
  end  
  
 def create  #this is where http post requests go
    #bechtol's code
    @person = Person.new(person_params_with_vote_balance)
    if @person.save
    render json: @person, status: :created, location: @person
    #@person = Person.new(person_params) #hard coding initial vote balance. 
    #if @person.save
     #move render below @vote_balance 
    # render json: @person, status: :created, location: @person
     #move vote_balnce to person.save
     # @vote_balance = VoteBalance.new(:person_id =>@person.id,:vote_balance =>50)
     # if @vote_balance.save
     # puts "vote_balance updated"
     # else
     #  puts "vote_balance FAILED"
     # end 
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    if @person.update(person_params)
        head :no_content
      else
         render json: @person.errors, status: :unprocessable_entity
      end
    end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy 

    head :no_content
  end

private
# Use callbacks to share common setup or constraints between actions 

def set_person
    @person = Person.find(params[:id])
end
def person_params
	#params.require(:person).permit(:id, :first_name, :last_name, :email_address, :password)
        params.permit(:id, :first_name, :last_name, :email_address, :password)
end 

end 
