class CollegesController < ApplicationController
  before_action :authenticate_user!

  # GET /colleges
  # GET /colleges.json
  def index
    @colleges = College.all
    #render json: @colleges
  end

  # GET /colleges/1
  # GET /colleges/1.json
  def show
    authorize! :read, @college
    @college = College.find(params[:id])
  end

  # GET /colleges/new
  def new
    authorize! :create, @college
  end

  # GET /colleges/1/edit
  def edit
    authorize! :edit, @college
    @college = College.find(params[:id])
  end

  # POST /colleges
  # POST /colleges.json
  def create
    authorize! :create, @college
    @college = College.new(college_params)

    respond_to do |format|
      if @college.save
        format.html { redirect_to @college, notice: 'College was successfully created.' }
        format.json { render :show, status: :created, location: @college }
      else
        format.html { render :new }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colleges/1
  # PATCH/PUT /colleges/1.json
  def update
    authorize! :create, @college
    respond_to do |format|
      if @college.update(college_params)
        format.html { redirect_to @college, notice: 'College was successfully updated.' }
        format.json { render :show, status: :ok, location: @college }
      else
        format.html { render :edit }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colleges/1
  # DELETE /colleges/1.json
  def destroy
    authorize! :destroy, @college
    @college.destroy
    respond_to do |format|
      format.html { redirect_to colleges_url, notice: 'College was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_college
      @college = College.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def college_params
      params.require(:college).permit(:name, :address, :address_2, :state, :email, :phone, :description)
    end
end
