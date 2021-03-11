class FormsController < ApplicationController
  before_action :set_form, only: %i[ show edit update destroy ]

  # GET /forms or /forms.json
  def index
    @forms = Form.all
  end

  # GET /forms/1 or /forms/1.json
  def show
  end

  def send_form
  end

  # GET /forms/new
  def new
    @form = Form.new
    @form.questions.build
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms or /forms.json
  def create
    @form = Form.new(form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: "Form was successfully created." }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1 or /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: "Form was successfully updated." }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1 or /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: "Form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def send_form
    @forms_response = FormsResponse.new(forms_response_params)
    if @forms_response.save
      redirect_to forms_path, notice: 'Form Send Successfully'
    else
      redirect_to forms_path, notice: 'Error sending form'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    def forms_response_params
      params.require(:forms_response).permit(:form_id,:supervisor_id,:employee_id,:external_reviewer_id)
    end

    # Only allow a list of trusted parameters through.
    def form_params
      params.require(:form).permit(:name, :password,
        questions_attributes: [:id, :label, :form_id,:question_type, :_destroy,
        options_attributes: [:id,:label,:_destroy]])
    end
end
