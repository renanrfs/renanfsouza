require 'elasticsearch/model'

class Article < ApplicationRecord
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks
end

# Delete the previous articles index in Elasticsearch
Article.__elasticsearch__.client.indices.delete index: Article.index_name rescue nil

# Create the new index with the new mapping
Article.__elasticsearch__.client.indices.create \
  index: Article.index_name,
  body: { settings: Article.settings.to_hash, mappings: Article.mappings.to_hash }

# for auto sync model with elastic search
Article.import force: true
