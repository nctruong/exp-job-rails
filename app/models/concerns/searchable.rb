module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    index_name(Rails.configuration.common['elasticsearch_index'])

    settings do
      mapping dynamic: 'false' do
        indexes :title, type: 'text', analyzer: 'snowball'
      end
    end
  end
end
