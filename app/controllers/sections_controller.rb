class SectionsController < ApplicationController
  def show
    #TODO need to add validation agains authentication
    @survey = Survey.public_surveys.find_by_code(params[:survey_id])
    if @survey.nil?
      flash[:danger] = "This Survey doesn't exist, is inactive or isn't public"
      redirect_to root_path
      return
    end
    session[@survey.code] ||= {}
    @section = @survey.sections.where(:slug => params[:id]).first
    if @section.nil?
      flash[:danger] = "This section doesn't exist for this survey"
      redirect_to root_path
      return
    end
    @current_section_index = @survey.sections.order(:order).index(@section) +1
    @previous_section = @survey.sections.where('"order" < ?',@section.order ).first
    if !session[@survey.code]['response_set_id'].nil?
      stored_section=Section.find(session[@survey.code]['section_id'])
      if !@previous_section.nil? && stored_section.order < @previous_section.order
        #looks like someone is trying to enter directly to an advanced section, we don't want that!
        flash[:danger] = "Hey! you have to follow the survey sections in order!, here you are in the first section"
        redirect_to survey_section_path(@survey,@survey.sections.order(:order).first)
      else
        begin
          @response_set = ResponseSet.find(session[@survey.code]['response_set_id'])
        rescue
          session[@survey.code]['response_set_id'] = nil
          @response_set = ResponseSet.new()
        end
        @responses = @response_set.responses
      end
    else
      @response_set = ResponseSet.new()
      if !@previous_section.nil?
        flash[:danger] = "Hey! you have to follow the survey sections in order!, here you are in the first section"
        redirect_to survey_section_path(@survey,@survey.sections.order(:order).first)
        return
      end
    end
    @next_section = @survey.sections.where('"order" > ?',@section.order ).first
    @total_sections = @survey.sections.count
  end
end
