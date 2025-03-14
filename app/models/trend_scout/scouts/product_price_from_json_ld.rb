module TrendScout
  module Scouts
    class ProductPriceFromJsonLd < TrendScout::Scout
      store_accessor :properties, :url

      def perform
        resp = Faraday.get(url)
        doc = Nokogiri.HTML5(resp.body)
        product_fragment = doc.css('[type="application/ld+json"]').to_a.filter do |col|
          json = JSON.parse(col.text)
          json["@type"] == "Product"
        end.first

        JSON.parse(product_fragment.text)['offers']['price']
      end
    end
  end
end
