class SurveysController < ApplicationController
  def respond
    @survey = Survey.public_surveys.find(params[:id])
  end
end
