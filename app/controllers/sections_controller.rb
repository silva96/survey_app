class SectionsController < ApplicationController
  def show
    @survey = Survey.public_surveys.find_by_code(params[:survey_id])
    @section = @survey.sections.where(:slug => params[:id]).first
    if @section.nil?
      flash[:danger] = "This section doesn't exist for this survey"
      redirect_to root_path
      return
    end
    @current_section = @survey.sections.order(:order).index(@section) +1
    if @current_section > 1
      @previous_section = @survey.sections.where('"order" < ?',@section.order ).first
    else
      @previous_section = nil
    end
    @next_section = @survey.sections.where('"order" > ?',@section.order ).first
    @total_sections = @survey.sections.count
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "This Survey doesn't exist, is inactive or isn't public"
    redirect_to root_path
  end
end
