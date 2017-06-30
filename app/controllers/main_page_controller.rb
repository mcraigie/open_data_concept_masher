class MainPageController < ApplicationController
  def random
    random_datasets =  OpenDataset.order("RANDOM()").limit(2)
    redirect_to action: "mashup", a: random_datasets.first.id, b: random_datasets.last.id
  end

  def mashup
    @a = OpenDataset.find(params[:a])
    @b = OpenDataset.find(params[:b])
    @pair = [@a, @b]
    @mashup_name = "#{@a.name} + #{@b.name}"
  end
end
