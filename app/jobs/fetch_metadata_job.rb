require 'open-uri'

class FetchMetadataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    search_page_limit = 350
    Portal.find(:all) do |portal|
      (1..search_page_limit).each do |page_number|
        doc = Nokogiri::HTML(open("#{portal.search_base_url}#{page_number}"))

        doc.css(portal.dataset_element_selector).each do |e|
          relative_url = e.css(portal.dataset_relative_url_selector)[0]['href']
          full_url = "#{portal.dataset_base_url}#{relative_url}"

          next if OpenDataset.where(["url = ?", full_url])[0]

          OpenDataset.create(
            portal:      portal,
            category:    Category.first,
            name:        e.css(portal.dataset_name_selector)[0].text,
            description: e.css(portal.dataset_description_selector)[0].text,
            url:         full_url
          )
        end
      end
    end
  end
end
