class FormsResponsesController < ApplicationController
  before_action :set_forms_response, only: %i[ show edit update destroy fill_form ]

  # GET /forms_responses or /forms_responses.json
  def index
    @forms_responses = FormsResponse.all
  end

  # GET /forms_responses/1 or /forms_responses/1.json
  def show
  end

  # GET /forms_responses/new
  def new
    @forms_response = FormsResponse.new
  end

  def fill_form
    @forms_response.build_form_answers    
  end

  # GET /forms_responses/1/edit
  def edit
  end

  # POST /forms_responses or /forms_responses.json
  def create
    @forms_response = FormsResponse.new(forms_response_params)

    respond_to do |format|
      if @forms_response.save
        format.html { redirect_to @forms_response, notice: "Forms response was successfully created." }
        format.json { render :show, status: :created, location: @forms_response }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @forms_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms_responses/1 or /forms_responses/1.json
  def update
    respond_to do |format|
      if @forms_response.update(forms_response_params)
        format.html { redirect_to @forms_response, notice: "Forms response was successfully updated." }
        format.json { render :show, status: :ok, location: @forms_response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @forms_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms_responses/1 or /forms_responses/1.json
  def destroy
    @forms_response.destroy
    respond_to do |format|
      format.html { redirect_to forms_responses_url, notice: "Forms response was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forms_response
      @forms_response = FormsResponse.find(params[:id])
    end

    def stringify_template_records_values
      if params[:forms_response].present?
        if params[:forms_response][:answers_attributes].present?
          params[:forms_response][:answers_attributes].each do |ind, tr|
            if tr[:value].kind_of?(Array)
              params[:forms_response][:answers_attributes][ind][:value] = tr[:value].reject(&:blank?).to_s
            end
          end
        end
      end
    end

    # Only allow a list of trusted parameters through.
    def forms_response_params
      stringify_template_records_values
      params.require(:forms_response).permit(:form_id, :employee_id, :supervisor_id, :external_reviewer_id, :password,
        answers_attributes: [:id, :question_id, :value, :_destroy]
        )
    end
end
