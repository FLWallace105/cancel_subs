# Cancel Subs

This is a simple script to cancel subscriptions on Shopify. CARE must be taken when supplying a subscription id as it WILL cancel with no fallback. So make sure you provide the correct subscription id.

## Getting Started

To see all the subscriptions use the following

```
rake get_all_subscriptions[5960020434]
```
The above number can be found by searching Shopify for the customer email and copying the id in the resulting URL.

To cancel a subscription use the following

```
rake cancel_subscription[12253007]
```

Just make sure you use the correct subscription id in the listing you get when you list all subscriptions above for a Shopify Customer ID. DO NOT get sloppy when copying and pasting and forget to copy ALL the digits in the subscription id or you WILL DELETE the WRONG subscription. This is a quick and dirty tool and is dangerous if used without enough focus.



### Prerequisites

Ruby 2.5.0, HTTParty, dotenv for configuration. Use something like this in your .env file

```
RECHARGE_ACCESS_TOKEN="your_recharge_token"
```