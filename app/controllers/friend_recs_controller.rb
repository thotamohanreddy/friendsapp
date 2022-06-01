class FriendRecsController < ApplicationController
  before_action :set_friend_rec, only: %i[ show edit update destroy ]
  before_action :authenticate_user!,except: [:index, :show]
  before_action :correct_user,only: [:edit,:update,:destroy]
  # GET /friend_recs or /friend_recs.json
  def index
    @friend_recs = FriendRec.all
  end

  # GET /friend_recs/1 or /friend_recs/1.json
  def show
  end

  # GET /friend_recs/new
  def new
    @friend_rec = current_user.friend_recs.build
  end

  # GET /friend_recs/1/edit
  def edit
  end

  # POST /friend_recs or /friend_recs.json
  def create
    #@friend_rec = FriendRec.new(friend_rec_params)
    @friend_rec = current_user.friend_recs.build(friend_rec_params)
    respond_to do |format|
      if @friend_rec.save
        format.html { redirect_to friend_rec_url(@friend_rec), notice: "Friend rec was successfully created." }
        format.json { render :show, status: :created, location: @friend_rec }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend_rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friend_recs/1 or /friend_recs/1.json
  def update
    respond_to do |format|
      if @friend_rec.update(friend_rec_params)
        format.html { redirect_to friend_rec_url(@friend_rec), notice: "Friend rec was successfully updated." }
        format.json { render :show, status: :ok, location: @friend_rec }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend_rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_recs/1 or /friend_recs/1.json
  def destroy
    @friend_rec.destroy

    respond_to do |format|
      format.html { redirect_to friend_recs_url, notice: "Friend rec was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def correct_user
    @friend_rec = current_user.friend_recs.find_by(id: params[:id])
    redirect_to friend_recs_path,notice:"Not Authorized To Edit This Friend" if @friend_rec.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_rec
      @friend_rec = FriendRec.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_rec_params
      params.require(:friend_rec).permit(:first_name, :last_name, :email, :phone, :twitter,:user_id)
    end
end
