select 
  ad_date,
  campaign_id,
  sum(spend) as total_spend,
  sum(impressions) as total_impressions,
  sum(clicks) as total_clicks,
  sum(value) as total_value,
  round(sum(spend)::numeric/sum(clicks), 2) as cpc,
  round(sum(spend)::numeric/sum(impressions), 2) as cpm,
  round(sum(clicks)::numeric/sum(impressions), 2) as ctr,
  round((sum(value) - sum(spend))::numeric/sum(spend)*100, 2) as romi
from facebook_ads_basic_daily fabd
group by ad_date, campaign_id
having sum(spend) > 0 and sum(clicks) > 0 and sum(impressions) > 0
order by ad_date ;

