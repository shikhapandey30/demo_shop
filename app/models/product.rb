class Product < ApplicationRecord
	mount_uploader :image, ImageUploader

	STATUS = {:active => "Active", :inactive => "In active"} 

  def status_display
    Product::STATUS[status]
  end

  def display_price
    result = ""
    if self.price.to_f > 0
      result += "#{self.price.to_i}"
    end
    return result
  end

  def display_full_price
    result = ""
    if self.full_price.to_f > 0
      result += "#{self.full_price.to_i}"
    end
    return result
  end


  def discount_percentage
    if price.present? && price > 0 && full_price.present? && full_price > 0
      " " + (100 - (price.to_f / full_price.to_f * 100.0)).to_s + "%"
    else
      nil
    end
  end

end
