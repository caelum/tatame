
require 'gruff' 

class GraphicsController < ApplicationController 
  
  def index 
    @programming_languages = Dojo.programming_languages
  end

end
