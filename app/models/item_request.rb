class ItemRequest < ActiveRecord::Base

  def approved_on_format
    approvedOn.nil? ? '' : approvedOn.to_date
  end
end
