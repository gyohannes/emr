class ArtAssessmentAndPlansController < ApplicationController
  before_action :set_art_assessment_and_plan, only: [:show, :edit, :update, :destroy]

  # GET /art_assessment_and_plans
  # GET /art_assessment_and_plans.json
  def index
    @art_assessment_and_plans = ArtAssessmentAndPlan.all
  end

  # GET /art_assessment_and_plans/1
  # GET /art_assessment_and_plans/1.json
  def show
  end

  # GET /art_assessment_and_plans/new
  def new
    @art_assessment_and_plan = ArtAssessmentAndPlan.new
  end

  # GET /art_assessment_and_plans/1/edit
  def edit
  end

  # POST /art_assessment_and_plans
  # POST /art_assessment_and_plans.json
  def create
    @art_assessment_and_plan = ArtAssessmentAndPlan.new(art_assessment_and_plan_params)

    respond_to do |format|
      if @art_assessment_and_plan.save
        format.html { redirect_to @art_assessment_and_plan, notice: 'Art assessment and plan was successfully created.' }
        format.json { render :show, status: :created, location: @art_assessment_and_plan }
      else
        format.html { render :new }
        format.json { render json: @art_assessment_and_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /art_assessment_and_plans/1
  # PATCH/PUT /art_assessment_and_plans/1.json
  def update
    respond_to do |format|
      if @art_assessment_and_plan.update(art_assessment_and_plan_params)
        format.html { redirect_to @art_assessment_and_plan, notice: 'Art assessment and plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @art_assessment_and_plan }
      else
        format.html { render :edit }
        format.json { render json: @art_assessment_and_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /art_assessment_and_plans/1
  # DELETE /art_assessment_and_plans/1.json
  def destroy
    @art_assessment_and_plan.destroy
    respond_to do |format|
      format.html { redirect_to art_assessment_and_plans_url, notice: 'Art assessment and plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art_assessment_and_plan
      @art_assessment_and_plan = ArtAssessmentAndPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_assessment_and_plan_params
      params.require(:art_assessment_and_plan).permit(:date, :art_patient_id, :ARV_eleigibility_criteria, :plan)
    end
end
