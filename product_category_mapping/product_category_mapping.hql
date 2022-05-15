use tesseract;
with product_table as 
(
select distinct
    case 
    when product_pnl_group_name like '%Business Applications and Other%' and product_pnl_category_name like '%Telephony%' and product_pnl_line_name like 'SmartLine%' then 'smartline' 
    when product_pnl_group_name like '%Business Applications and Other%' and product_pnl_category_name like '%Workspace%' and product_pnl_line_name like 'Email%' then 'email' 
    when product_pnl_group_name like '%Business Applications and Other%' and product_pnl_category_name like '%Workspace%' and (product_pnl_line_name like '%Open XChange%' or product_pnl_line_name like 'MS Office 365%') then 'ms_office_365'
    --when product_pnl_group_name like '%Business Applications and Other%' then 'business_application'
    when product_pnl_group_name = 'Domains' and product_pnl_category_name like 'Aftermarket%' then 'aftermarket'
    when product_pnl_group_name like '%Domains%' and product_pnl_category_name like '%Domain Add Ons%' and product_pnl_line_name like '%Domain Ownership Protection%' then 'domain_ownership_protection'
    when product_pnl_group_name like '%Domains%' and product_pnl_category_name like '%Domain Add Ons%' and product_pnl_line_name like '%Domains by Proxy%' then 'domains_by_proxy'
    when product_pnl_group_name like '%Domains%' and product_pnl_category_name like '%Domain Add Ons%' then 'domain_add_on'

    when product_pnl_group_name like '%Domains%' and product_pnl_category_name like '%Domain Registration%' and product_pnl_line_name like '%Domain Name Auction%' then 'domain_name_auction'
    when product_pnl_group_name like '%Domains%' and product_pnl_category_name like '%Domain Registration%' and product_pnl_line_name like '%Domain Name Premium%' then 'domain_name_premium'
    when product_pnl_group_name like '%Domains%' and product_pnl_category_name like '%Domain Registration%' and product_pnl_line_name like '%Domain Name Registration%' then 'domain_name_registration'
    when product_pnl_group_name like '%Domains%' and product_pnl_category_name like '%Domain Registration%' and product_pnl_line_name like '%Domain Name Transfer%' then 'domain_name_transfer'

    when product_pnl_group_name like '%Hosting%' and product_pnl_category_name like '%Other Hosting%' and product_pnl_line_name like '%Virtual Hosting%' then 'virtual_hosting'
    when product_pnl_group_name like '%Hosting%' and product_pnl_category_name like '%Other Hosting%' and product_pnl_line_name like '%Web Pro%' then 'web_pro'
    when product_pnl_group_name like '%Hosting%' and product_pnl_category_name like '%Security%' and product_pnl_line_name like '%SSL%' then 'ssl'
    when product_pnl_group_name like '%Hosting%' and product_pnl_category_name like '%Security%' and product_pnl_line_name like '%Website Protection%' then 'website_protection'
    when product_pnl_group_name like '%Hosting%' and product_pnl_category_name like '%Web Hosting%' and product_pnl_line_name like '%CnP Hosting%' then 'cnp_hosting'
    when product_pnl_group_name like '%Hosting%' and product_pnl_category_name like '%Web Hosting%' and product_pnl_line_name like '%WordPress Managed Plans%' then 'wordpress'
    when product_pnl_group_name like '%Hosting%' then 'hosting'
    when product_pnl_group_name like '%Presence and Commerce%' and product_pnl_category_name like '%Presence%' then 'website_builder'
    when product_pnl_group_name like '%Presence and Commerce%' and product_pnl_category_name like '%Commerce%' then 'commerce'
    when product_pnl_group_name like '%Presence and Commerce%' and product_pnl_category_name like '%Engage Customers%' then 'engage_customers'
    else 'others'
    end as product

from analytic.ads_bill_line
where partition_bill_mst_year_month >= '2022-02'
)
select 
    product,
    case
    when product='smartline' then 'SmartLine'
    when product='email' then 'Email'
    when product='ms_office_365' then 'MS Office 365'
    --when product='business_application' then 'Business Applications and Other'
    when product='aftermarket' then 'Domain Aftermarket'
    when product='domain_ownership_protection' then 'Domain Add Ons'
    when product='domains_by_proxy' then 'Domain Add Ons'
    when product='domain_add_ons' then 'Domain Add Ons'
    when product='domain_name_auction' then 'Domain Name Auction'
    when product='domain_name_premium' then 'Domain Name Premium'
    when product='domain_name_registration' then 'Domain Name Registration'
    when product='domain_name_transfer' then 'Domain Name Transfer'
    when product='ssl' then 'SSL'
    when product='website_protection' then 'Website Protection'
    when product='wordpress' then 'WordPress Managed Plans'
    when product='cnp_hosting' then 'CnP Hosting'
    when product='virtual_hosting' then 'Hosting'
    when product='web_pro' then 'Hosting'
    when product='hosting' then 'Hosting'
    when product='website_builder' then 'Website Builder'
    when product='commerce' then 'Commerce'
    when product='engage_customers' then 'Engage Customers'
    else 'others'
    end as product_category
    from product_table
