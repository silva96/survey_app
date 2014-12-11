class ResponseSetsController < ApplicationController
  def create
    s = Survey.public_surveys.find_by_code(params[:survey_id])
    sect=Section.find(params[:response_set][:section_id])
    @response_set = current_user.response_sets.build(response_set_params.merge(survey_id: s.id))
    next_section = s.sections.where('"order" > ?',sect.order ).first
    if next_section.nil?
      @response_set.incomplete = false
    else
      @response_set.incomplete = true
    end
    if @response_set.save
      save_responses(@response_set,s,sect,next_section)
    else
      flash[:danger] = "Your answers could not be saved"
      redirect_to survey_section_path(params[:survey_id],params[:section_id])
    end
  end

  def update
    s = Survey.public_surveys.find_by_code(params[:survey_id])
    sect=Section.find(params[:response_set][:section_id])
    @response_set = ResponseSet.find(params[:id])
    next_section = s.sections.where('"order" > ?',sect.order ).first
    if next_section.nil?
      @response_set.incomplete = false
    else
      @response_set.incomplete = true
    end
    save_responses(@response_set,s,sect,next_section)
  end

  private
    def response_set_params
      params.require(:response_set).permit(:survey_id, :user, :incomplete)
    end
    def save_responses(response_set,s,sect,next_section)
      session[s.code] ||= {}
      session[s.code]['response_set_id'] = response_set.id
      if !session[s.code]['section_id'].nil?
        #check if current section is smaller than saved one
        current_index = s.sections.order(:order).index(sect)
        saved_index   = s.sections.order(:order).index(Section.find_by_id(session[s.code]['section_id']))
        if saved_index < current_index
          session[s.code]['section_id']=sect.id
        end
      else
        session[s.code]['section_id'] = sect.id
      end
      params[:answer].each do |q,a|
        question=Question.find(q)
        if(question.type.name == 'free-text')
          text_value = a
          answer = Answer.where(:question_id => q).first #since for free text question, there should be one and only one answer
        elsif(question.type.name == 'satisfaction-100')
          text_value = ""
          answer = Answer.find(a)
        end

        response= response_set.responses.find_or_initialize_by(question_id: question.id)
        response.update(:answer => answer, :text_value => text_value)
        #response_set.responses.create(:answer => answer, :text_value => text_value)
      end
      if !response_set.incomplete
        session[s.code]['response_set_id'] = nil
        session[s.code]['section_id'] = nil
        redirect_to thanks_survey_path(s)
      else
        redirect_to survey_section_path(s.code,next_section)
      end
    end
end
