include ActionView::Helpers::TextHelper

class MainPageController < ApplicationController
  DATASET_QUERY_LIMIT = 10
  MINIMUM_NAME_DISTANCE = 20

  def index
  end

  def mashup
    begin
      @a = OpenDataset.find(params[:a])
      @b = OpenDataset.find(params[:b])
    rescue ActiveRecord::ActiveRecordError => e
      OpenDataset.uncached do
        tmp = OpenDataset.order("RANDOM()").first(DATASET_QUERY_LIMIT)
        @a = tmp.first
        @b = tmp.second

        loop do
          break if Levenshtein.distance(@a.name, @b.name) >= MINIMUM_NAME_DISTANCE
          @b = tmp.sample
        end
      end

      redirect_to action: "mashup", a: @a.id, b: @b.id and return
    end

    a_truncated = truncate(@a.name, :length => 27)
    b_truncated = truncate(@b.name, :length => 27)

    @tweet_url = "https://twitter.com/intent/tweet?text="
    @tweet_url << ERB::Util.url_encode("#{a_truncated} + #{b_truncated}\n")
    @tweet_url << ERB::Util.url_encode("#opendata #mashup concept\n")
    @tweet_url << ERB::Util.url_encode(request.original_url)
  end
end
