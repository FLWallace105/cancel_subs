#cancel_sub.rb
require 'dotenv'
Dotenv.load
require 'httparty'

module CancelSub
    class SubInfo

        def initialize
            @recharge_token = ENV['RECHARGE_ACCESS_TOKEN']
            @my_change_header = {
                "X-Recharge-Access-Token" => @recharge_token,
                "Accept" => "application/json",
                "Content-Type" =>"application/json"
            }

            @my_info_header = {
                "X-Recharge-Access-Token" => @recharge_token
            }
        end

        def get_all_subs_shopify_customer(shopify_id)
            subscriptions = HTTParty.get("https://api.rechargeapps.com/subscriptions?shopify_customer_id=#{shopify_id}", :headers => @my_info_header)

            mysubslist = subscriptions['subscriptions']

            mysubslist.each do |mysub|
                if mysub['status'] == 'ACTIVE'
                    puts "-----"
                    #puts mysub.inspect
                    puts "#{mysub['id']} #{mysub['product_title']} #{mysub['next_charge_scheduled_at']}"
                    puts "-----"
                end
            end
        end

        def cancel_subscription(sub_id)
            #POST /subscriptions/<subscription_id>/cancel
            myreason = { "cancellation_reason" => "Test Subscription"}.to_json
            my_cancel = HTTParty.post("https://api.rechargeapps.com/subscriptions/#{sub_id}/cancel", :body => myreason, :headers => @my_change_header)
            puts my_cancel.inspect

        end

    end
end