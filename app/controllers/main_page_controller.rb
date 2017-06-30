class MainPageController < ApplicationController
  def index
    random_datasets =  OpenDataset.order("RANDOM()").limit(2)
    a = OpenDataset.order("RANDOM()").first
    b = OpenDataset.order("RANDOM()").last
    @mashup_name = "#{a.name} + #{b.name}"
  end
end
