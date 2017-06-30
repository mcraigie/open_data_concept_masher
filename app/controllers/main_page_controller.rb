class MainPageController < ApplicationController
  def random
    OpenDataset.uncached do
      tmp = OpenDataset.order("RANDOM()").first(10)
      a = tmp.first
      b = tmp.second
      
      loop do
        break if Levenshtein.distance(a.name, b.name) >= 5
        b = tmp.sample
      end

      redirect_to action: "mashup", a: a.id, b: b.id
    end    
  end

  def mashup
    @a = OpenDataset.find(params[:a])
    @b = OpenDataset.find(params[:b])
    @pair = [@a, @b]
    @mashup_name = "#{@a.name} + #{@b.name}"
  end
end
