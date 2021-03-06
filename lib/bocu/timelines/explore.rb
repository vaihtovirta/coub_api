module Bocu
  module Timelines
    class Explore
      include Her::Model
      include CommonScopes

      CATEGORIES = %i[coub_of_the_day newest random].freeze

      collection_path "#{Bocu::TIMELINE_ENDPOINT}/explore/:category_id"
      parse_root_in_json :coubs, format: :active_model_serializers

      CATEGORIES.each { |category| scope category, -> { where(category_id: category) } }
    end
  end
end
