#rakefile
require_relative "cancel_sub"

#get_orders_customer(customer_id)
desc 'get all subscriptions for a shopify customer'
task :get_all_subscriptions, :shopify_id do |t, args|

    shopify_id = args['shopify_id']
    CancelSub::SubInfo.new.get_all_subs_shopify_customer(shopify_id)
  end

#cancel_subscription(sub_id)
desc 'cancel a subscription based on subscription id'
task :cancel_subscription, :sub_id do |t, args|
    sub_id = args['sub_id']
    CancelSub::SubInfo.new.cancel_subscription(sub_id)

end