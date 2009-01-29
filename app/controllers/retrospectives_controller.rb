class RetrospectivesController < ApplicationController
  before_filter :require_login

  def edit
    @retrospective = Retrospective.find(params[:id])
  end
end
