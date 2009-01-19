class ProblemsController < ApplicationController
  def index
    @problems = Problem.find(:all)
  end
  def new
    @problem = Problem.new
  end
end
