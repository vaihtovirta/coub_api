module CoubApi
  class Coub
    include CommonScopes, Her::Model

    class << self
      def search(query)
        Search.with_query(query)
      end

      def by_tag(tag_name)
        CoubApi::Timelines::Tag.by_tag(tag_name)
      end

      def hot
        CoubApi::Timelines::Hot.all
      end

      CoubApi::Timelines::Explore::CATEGORIES.each do |category|
        define_method category do
          Timelines::Explore.send(category)
        end
      end
    end
  end
end
