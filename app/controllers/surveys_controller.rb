class SurveysController < ApplicationController
  def thanks
    @survey = Survey.public_surveys.find_by_code(params[:id])
  end
end
