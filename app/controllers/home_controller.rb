class HomeController < ApplicationController
  def index
    @surveys = Survey.public_surveys
  end
end
