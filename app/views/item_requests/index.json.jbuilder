json.array!(@item_requests) do |item_request|
  json.extract! item_request, :id, :itemName, :reason, :price, :isApproved, :approvedBy, :approvedOn
  json.url item_request_url(item_request, format: :json)
end
