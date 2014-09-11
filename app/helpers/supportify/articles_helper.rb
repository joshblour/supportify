module Supportify
  module ArticlesHelper
    def tag_options_helper field_name
      Article.select("unnest(#{field_name}) tags").uniq.map(&:tags)
    end
  end
end
