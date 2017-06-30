class MainPageController < ApplicationController
  def random
    tmp = OpenDataset.order("RANDOM()")
    a = tmp.first
    b = tmp.second
    loop do
      if Levenshtein.distance(a.name, b.name) >= 6
        break
      else
        OpenDataset.uncached do
      	b = OpenDataset.order("RANDOM()").first
        end
      end
    end

    redirect_to action: "mashup", a: a.id, b: b.id
  end

  def mashup
    @a = OpenDataset.find(params[:a])
    @b = OpenDataset.find(params[:b])
    @pair = [@a, @b]
    @mashup_name = "#{@a.name} + #{@b.name}"
  end
end
