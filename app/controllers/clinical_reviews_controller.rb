class ClinicalReviewsController < ApplicationController
  before_action :set_clinical_review, only: [:show, :edit, :update, :destroy]

  # GET /clinical_reviews
  # GET /clinical_reviews.json
  def index
    @clinical_reviews = ClinicalReview.all
  end

  # GET /clinical_reviews/1
  # GET /clinical_reviews/1.json
  def show
  end

  # GET /clinical_reviews/new
  def new
    @clinical_review = ClinicalReview.new(who_staging: {who_stage1_conditions: {},who_stage2_conditions: {},who_stage3_conditions: {},who_stage4_conditions: {}})
  end

  # GET /clinical_reviews/1/edit
  def edit
  end

  # POST /clinical_reviews
  # POST /clinical_reviews.json
  def create
    @clinical_review = ClinicalReview.new(clinical_review_params)

    respond_to do |format|
      if @clinical_review.save
        format.html { redirect_to @clinical_review, notice: 'Clinical review was successfully created.' }
        format.json { render :show, status: :created, location: @clinical_review }
      else
        format.html { render :new }
        format.json { render json: @clinical_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinical_reviews/1
  # PATCH/PUT /clinical_reviews/1.json
  def update
    respond_to do |format|
      if @clinical_review.update(clinical_review_params)
        format.html { redirect_to @clinical_review, notice: 'Clinical review was successfully updated.' }
        format.json { render :show, status: :ok, location: @clinical_review }
      else
        format.html { render :edit }
        format.json { render json: @clinical_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinical_reviews/1
  # DELETE /clinical_reviews/1.json
  def destroy
    @clinical_review.destroy
    respond_to do |format|
      format.html { redirect_to clinical_reviews_url, notice: 'Clinical review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinical_review
      @clinical_review = ClinicalReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinical_review_params
      params.require(:clinical_review).permit(:date, :art_patient_id, who_staging: {}, clinical_review: {})
    end
end
