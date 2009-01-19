class ProblemsController < ApplicationController
  def index
    @katas = Problem.find(:all, :conditions => ['kata = ?', true])
    @randoris = Problem.find(:all, :conditions => ['kata = ?', false])
  end
  def new
    @problem = Problem.new
  end
end
