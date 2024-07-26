# Pizza_Sales_Analysis

### Introduction
Things are going OK here at Plato's, but there's room for improvement. They've been collecting transactional data for the past year, but really haven't been able to put it to good use. Hoping we can analyze the data and put together a report to help us find opportunities to drive more sales and work more efficiently.

### About DataSet

This pizza sales dataset make up 12 relevant features:

order_id: Unique identifier for each order placed by a table

order_details_id: Unique identifier for each pizza placed within each order (pizzas of the same type and size are kept in the same row, and the quantity increases)

pizza_id: Unique key identifier that ties the pizza ordered to its details, like size and price

quantity: Quantity ordered for each pizza of the same type and size

order_date: Date the order was placed (entered into the system prior to cooking & serving)

order_time: Time the order was placed (entered into the system prior to cooking & serving)

unit_price: Price of the pizza in USD

total_price: unit_price * quantity

pizza_size: Size of the pizza (Small, Medium, Large, X Large, or XX Large)

pizza_type: Unique key identifier that ties the pizza ordered to its details, like size and price

pizza_ingredients: ingredients used in the pizza as shown in the menu (they all include Mozzarella Cheese, even if not specified; and they all include Tomato Sauce, unless another sauce is specified)

pizza_name: Name of the pizza as shown in the menu

### Analysis
Analysis was done on SQL and visualized on Tableau. I chose to use SQL for the analysis because With SQL, you can analyze small and big datasets, investigate problems and generate sales reports faster. I uploaded the dataset first on SQL Server where I did all the analysis before visualizing it on Tableau.

### Findings

Year considered - 2015

Total_Orders - 48,620

Number_of_pizza_types - 32

Total_Quantity_Sold - 49,574

Total_revenue - $817,860.05

Average_revenue - $16.82

<noscript><a href='https://public.tableau.com/views/PizzaSalesAnalysisMentorness/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link'><img alt='DATA ANALYSIS DASHBOARD ' src='https://github.com/user-attachments/assets/caec857b-6a2e-4506-9517-a31e157304d3' style='border: none' /></a></noscript>



### Conclusion
Pizza orders and revenue maintains an upward trajectory from the beginning of the week Sunday and peaks on Friday before it starts dropping, this means most people prefer to eat pizza towards and during the weekend. Most people prefer to have the Pepperoni pizza for lunch on Fridays. It is advisable to make available tables and chairs to be able to accomodate the influx of the weekend, we can also explore the option of delivery services. The Ingrdients for Pepperoni pizza should be made readily available and in large quantities on or before Fridays. Since more orders are received on Fridays, a discount policy can be introduced every last Friday of the month where a customer gets 1 extra pizza when they buy 3 and above, this will encourage them to buy more.


***
<div align='center'>
<noscript><a href='#'><img alt='logo' src='https://github.com/user-attachments/assets/8cc3be12-83a3-44dc-b598-a54211cfb919' style='border: none' /></a></noscript>
</div>
