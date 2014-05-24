
require 'gruff' 

class GraphicsController < ApplicationController 
  
  def index 
  end

  def generate_image
    g = Gruff::Bar.new 
    g.title = "Estatistics"

    Dojo.programming_languages.each do |l|
      g.data(l[0], l[1])
    end

   g.minimum_value = 0
   send_data(g.to_blob, :disposition => 'inline', :type => 'image/png', :filename => "arbitaryfilename.png")
  end
end
