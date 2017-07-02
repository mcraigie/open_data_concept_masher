# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

portal = Portal.find(1)
Portal.create(
  name:                          "Data Vic",
  description:                   "Victoria's open data directory",
  search_base_url:               'https://www.data.vic.gov.au/data/dataset?sort=views_recent+desc&page=',
  dataset_base_url:              'https://www.data.vic.gov.au',
  dataset_element_selector:      'li.dataset-item',
  dataset_relative_url_selector: 'h3.dataset-heading a',
  dataset_name_selector:         'h3.dataset-heading a',
  dataset_description_selector:  'div.notes-truncate-at-mobile'
) unless portal

category = Category.find(1)
Category.create(
  name:                          "test"
) unless category

FetchMetadataJob.perform_now