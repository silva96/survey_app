class SurveysController < ApplicationController
  def respond
    @survey = Survey.public_surveys.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "This Survey doesn't exist, is inactive or isn't public"
    redirect_to root_path
  end
end
