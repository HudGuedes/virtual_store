include ActionView::Helpers::TagHelper
include ActionView::Helpers::NumberHelper
include ActionView::Context
module ProductHelper
  def price(product)
    tag.p do
      if product.has_discount?
        "De #{format_price(product.price)} por  #{format_price(product.price_discount)}"
      else
        format_price(product.price)
      end
    end
  end

  def format_price(price)
    number_to_currency(price, unit: 'R$')
  end
end