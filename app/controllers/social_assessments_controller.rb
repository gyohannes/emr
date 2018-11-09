class SocialAssessmentsController < ApplicationController
  before_action :set_social_assessment, only: [:show, :edit, :update, :destroy]

  # GET /social_assessments
  # GET /social_assessments.json
  def index
    @social_assessments = SocialAssessment.all
  end

  # GET /social_assessments/1
  # GET /social_assessments/1.json
  def show
  end

  # GET /social_assessments/new
  def new
    @social_assessment = SocialAssessment.new
  end

  # GET /social_assessments/1/edit
  def edit
  end

  # POST /social_assessments
  # POST /social_assessments.json
  def create
    @social_assessment = SocialAssessment.new(social_assessment_params)

    respond_to do |format|
      if @social_assessment.save
        format.html { redirect_to @social_assessment, notice: 'Social assessment was successfully created.' }
        format.json { render :show, status: :created, location: @social_assessment }
      else
        format.html { render :new }
        format.json { render json: @social_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_assessments/1
  # PATCH/PUT /social_assessments/1.json
  def update
    respond_to do |format|
      if @social_assessment.update(social_assessment_params)
        format.html { redirect_to @social_assessment, notice: 'Social assessment was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_assessment }
      else
        format.html { render :edit }
        format.json { render json: @social_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_assessments/1
  # DELETE /social_assessments/1.json
  def destroy
    @social_assessment.destroy
    respond_to do |format|
      format.html { redirect_to social_assessments_url, notice: 'Social assessment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_assessment
      @social_assessment = SocialAssessment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_assessment_params
      params.require(:social_assessment).permit(:date, :art_patient_id, :employment, :living_condition, :supportive_care, :disclosure, :family_members, :issues)
    end
end
