class PartnershipsController < ApplicationController
  before_action :set_partnership, only: [:show, :edit, :update, :destroy]

  # GET /partnerships
  # GET /partnerships.json
  def index
    @partnerships = current_user.partnerships
  end

  # GET /partnerships/1
  # GET /partnerships/1.json
	
  def show
	   @partnerships = current_user.partnerships
  end

  # GET /partnerships/new
  def new
    @partnership = Partnership.new()
  end

  # GET /partnerships/1/edit
  def edit
	   @partnerships = current_user.partnerships
  end

  # POST /partnerships
  # POST /partnerships.json
  def create
	  
    @partnership = Partnership.new(partnership_params)

    respond_to do |format|
      if @partnership.save
        format.html { redirect_to @partnership, notice: 'Partnership was successfully created.' }
        format.json { render :show, status: :created, location: @partnership }
      else
        format.html { render :new }
        format.json { render json: @partnership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partnerships/1
  # PATCH/PUT /partnerships/1.json
	
  def update
    respond_to do |format|
      if @partnership.update(partnership_params)
        format.html { redirect_to @partnership, notice: 'Partnership was successfully updated.' }
        format.json { render :show, status: :ok, location: @partnership }
      else
        format.html { render :edit }
        format.json { render json: @partnership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partnerships/1
  # DELETE /partnerships/1.json
  def destroy
    @partnership.destroy
    respond_to do |format|
      format.html { redirect_to partnerships_url, notice: 'Partnership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
	 #************Voting
	def upvote
		@partnership = Partnership.find(params[:id])
		@partnership.upvote_by current_user
		redirect_to @partnership
	end
	
	def downvote
	  @partnership = Partnership.find(params[:id])
	  @partnership.downvote_by current_user
	  redirect_to @partnership
	end
	
	
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partnership
      @partnership = Partnership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partnership_params
   params.require(:partnership).permit(:user_id, :project_id, :created_at, :updated_at, :role)
		
    end
end
