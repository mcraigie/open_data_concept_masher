class MainPageController < ApplicationController
  def index
  	random_datasets = OpenDataset.order("RANDOM()")
  	@a = random_datasets.first
  	@b = random_datasets.second
  	@mashup_name = "#{@a.name} + #{@a.name}"
  end
end
