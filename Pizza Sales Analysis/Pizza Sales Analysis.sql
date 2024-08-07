-- Pizza Sales Analysis By Chinmai Nimgade

show databases;
use pizzadb;
show tables;
select * from pizza_orders;

-- 1. The total no of orders placed
select count(*) from pizza_orders;
-- '21350'



-- 2. The total revenue generated
select round(sum(price*quantity),2) 
from pizzas, order_detail 
where pizzas.pizza_id = order_detail.pizza_id;
-- '817860.05'




-- 3. The highest priced pizza.
SELECT ptypes.pizza_name, pizzas.price
FROM ptypes JOIN pizzas 
ON ptypes.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC LIMIT 1;
-- 'The Barbecue Chicken Pizza', '35.95'

-- 4. The most common pizza size ordered.
select count(size), size 
from pizzas, order_detail 
where pizzas.pizza_id = order_detail.pizza_id 
group by size order by count(size) desc;
-- '18526', 'L'
-- '15385', 'M'
-- '14137', 'S'
-- '544', 'XL'
-- '28', 'XXL'

-- 5. The top 5 most ordered pizza types along their quantities.
SELECT pizza_name, sum(quantity) FROM pizzas 
JOIN order_detail 
ON pizzas.pizza_id = order_detail.pizza_id 
JOIN ptypes ON ptypes.pizza_type_id=pizzas.pizza_type_id
GROUP BY pizza_name
 ORDER BY sum(quantity) DESC limit 5;
-- 'The Classic Deluxe Pizza', '2453'
-- 'The Barbecue Chicken Pizza', '2432'
-- 'The Hawaiian Pizza', '2422'
-- 'The Pepperoni Pizza', '2418'
-- 'The Thai Chicken Pizza', '2371'


-- 6. The quantity of each pizza categories ordered.
 SELECT ptypes.category, sum(quantity) FROM pizzas 
JOIN order_detail ON pizzas.pizza_id = order_detail.pizza_id 
JOIN ptypes ON ptypes.pizza_type_id = pizzas.pizza_type_id
JOIN pizza_orders ON pizza_orders.order_id = order_detail.order_id 
GROUP BY ptypes.category
 ORDER BY sum(quantity) DESC ;
-- 'Classic', '14888'
-- 'Supreme', '11987'
-- 'Veggie', '11649'
-- 'Chicken', '11050'
 
-- 7. The distribution of orders by hours of the day. 
SELECT hour(time), sum(quantity) FROM pizzas 
JOIN order_detail ON pizzas.pizza_id = order_detail.pizza_id 
JOIN ptypes ON ptypes.pizza_type_id = pizzas.pizza_type_id
JOIN pizza_orders ON pizza_orders.order_id = order_detail.order_id 
GROUP BY hour(time)
 ORDER BY sum(quantity) DESC ;
-- '12', '6776'
-- '13', '6413'
-- '18', '5417'
-- '17', '5211'
-- '19', '4406'
-- '16', '4239'
-- '14', '3613'
-- '20', '3534'
-- '15', '3216'
-- '11', '2728'
-- '21', '2545'
-- '22', '1386'
-- '23', '68'
-- '10', '18'
-- '9', '4'

-- 8. The category-wise distribution of pizzas.
 SELECT category, count(pizza_name) FROM pizzas 
JOIN order_detail ON pizzas.pizza_id = order_detail.pizza_id 
JOIN ptypes ON ptypes.pizza_type_id = pizzas.pizza_type_id
JOIN pizza_orders ON pizza_orders.order_id = order_detail.order_id 
GROUP BY category
 ORDER BY count(pizza_name) DESC ;
-- 'Classic', '14579'
-- 'Supreme', '11777'
-- 'Veggie', '11449'
-- 'Chicken', '10815'

-- 9. The average number of pizzas ordered per day.
SELECT round(avg(Quantity),0) from
(SELECT pizza_orders.date, sum(order_detail.quantity) 
as quantity
FROM pizza_orders JOIN order_detail
ON pizza_orders.order_id = order_detail.order_id
GROUP BY pizza_orders.date) as sum; 
-- '138'

-- 10. Top 3 most ordered pizza type base on revenue.
  SELECT pizza_name , sum(Quantity*Price) as Revenue FROM pizzas 
JOIN order_detail ON pizzas.pizza_id = order_detail.pizza_id 
JOIN ptypes ON ptypes.pizza_type_id = pizzas.pizza_type_id
JOIN pizza_orders ON pizza_orders.order_id = order_detail.order_id 
GROUP BY pizza_name
 ORDER BY Revenue DESC LIMIT 3;
 -- 'The Thai Chicken Pizza', '43434.25'
-- 'The Barbecue Chicken Pizza', '42768'
-- 'The California Chicken Pizza', '41409.5'

-- 11. The percentage contribution of each pizza type to revenue.
SELECT pizza_name , round(sum(Quantity*Price)/
(SELECT sum(Quantity*Price) FROM pizzas 
 JOIN order_detail ON pizzas.pizza_id = order_detail.pizza_id 
 JOIN ptypes ON ptypes.pizza_type_id = pizzas.pizza_type_id)*100,2) 
 as Revenue_pc FROM pizzas 
JOIN order_detail ON pizzas.pizza_id = order_detail.pizza_id 
JOIN ptypes ON ptypes.pizza_type_id = pizzas.pizza_type_id
JOIN pizza_orders ON pizza_orders.order_id = order_detail.order_id 
GROUP BY pizza_name ORDER BY Revenue_pc DESC ;

-- 12. The cumulative revenue generated over time.
SELECT date , SUM(Revenue) OVER (ORDER BY date) as Cumulative_Rev
FROM (SELECT date, ROUND(SUM(Quantity*Price),0)  AS Revenue FROM pizzas 
JOIN order_detail ON pizzas.pizza_id = order_detail.pizza_id 
JOIN ptypes ON ptypes.pizza_type_id = pizzas.pizza_type_id
JOIN pizza_orders ON pizza_orders.order_id = order_detail.order_id
GROUP BY date ) AS Rev;
-- date,Cumulative_Rev
-- 2015-01-01,2714
-- 2015-01-02,5446
-- 2015-01-03,8108
-- 2015-01-04,9863
-- 2015-01-05,11929
-- 2015-01-06,14358
-- 2015-01-07,16560
-- 2015-01-08,19398
-- 2015-01-09,21525
-- 2015-01-10,23989
-- 2015-01-11,25861
-- 2015-01-12,27780
-- 2015-01-13,29830
-- 2015-01-14,32357
-- 2015-01-15,34342
-- 2015-01-16,36936
-- 2015-01-17,39000
-- 2015-01-18,40977
-- 2015-01-19,43364
-- 2015-01-20,45762
-- 2015-01-21,47803
-- 2015-01-22,50300
-- 2015-01-23,52724
-- 2015-01-24,55013
-- 2015-01-25,56631
-- 2015-01-26,58515
-- 2015-01-27,61043
-- 2015-01-28,63059
-- 2015-01-29,65104
-- 2015-01-30,67374
-- 2015-01-31,69792
-- 2015-02-01,72981
-- 2015-02-02,75310
-- 2015-02-03,77925
-- 2015-02-04,80159
-- 2015-02-05,82375
-- 2015-02-06,84885
-- 2015-02-07,87123
-- 2015-02-08,89158
-- 2015-02-09,91353
-- 2015-02-10,93409
-- 2015-02-11,95869
-- 2015-02-12,98028
-- 2015-02-13,100782
-- 2015-02-14,103101
-- 2015-02-15,105242
-- 2015-02-16,107211
-- 2015-02-17,109333
-- 2015-02-18,111976
-- 2015-02-19,114006
-- 2015-02-20,116897
-- 2015-02-21,119008
-- 2015-02-22,120588
-- 2015-02-23,122757
-- 2015-02-24,124952
-- 2015-02-25,127293
-- 2015-02-26,129554
-- 2015-02-27,132412
-- 2015-02-28,134952
-- 2015-03-01,136551
-- 2015-03-02,138930
-- 2015-03-03,141218
-- 2015-03-04,143662
-- 2015-03-05,146013
-- 2015-03-06,148527
-- 2015-03-07,150927
-- 2015-03-08,153115
-- 2015-03-09,155450
-- 2015-03-10,157839
-- 2015-03-11,160047
-- 2015-03-12,162042
-- 2015-03-13,164829
-- 2015-03-14,166868
-- 2015-03-15,168937
-- 2015-03-16,171232
-- 2015-03-17,174197
-- 2015-03-18,176272
-- 2015-03-19,178661
-- 2015-03-20,181122
-- 2015-03-21,183389
-- 2015-03-22,184648
-- 2015-03-23,186881
-- 2015-03-24,189043
-- 2015-03-25,190971
-- 2015-03-26,193187
-- 2015-03-27,195932
-- 2015-03-28,198184
-- 2015-03-29,200338
-- 2015-03-30,202593
-- 2015-03-31,205350
-- 2015-04-01,207527
-- 2015-04-02,210074
-- 2015-04-03,212612
-- 2015-04-04,215380
-- 2015-04-05,217290
-- 2015-04-06,219912
-- 2015-04-07,222146
-- 2015-04-08,224440
-- 2015-04-09,226487
-- 2015-04-10,228912
-- 2015-04-11,231456
-- 2015-04-12,233450
-- 2015-04-13,235946
-- 2015-04-14,238452
-- 2015-04-15,241031
-- 2015-04-16,243049
-- 2015-04-17,245725
-- 2015-04-18,248011
-- 2015-04-19,249539
-- 2015-04-20,251998
-- 2015-04-21,254211
-- 2015-04-22,256404
-- 2015-04-23,258830
-- 2015-04-24,261809
-- 2015-04-25,263898
-- 2015-04-26,265665
-- 2015-04-27,267846
-- 2015-04-28,269589
-- 2015-04-29,271418
-- 2015-04-30,274086
-- 2015-05-01,276658
-- 2015-05-02,279058
-- 2015-05-03,280890
-- 2015-05-04,283179
-- 2015-05-05,284893
-- 2015-05-06,287203
-- 2015-05-07,289432
-- 2015-05-08,292484
-- 2015-05-09,294852
-- 2015-05-10,297140
-- 2015-05-11,299528
-- 2015-05-12,301828
-- 2015-05-13,304090
-- 2015-05-14,306784
-- 2015-05-15,310170
-- 2015-05-16,312451
-- 2015-05-17,314279
-- 2015-05-18,316489
-- 2015-05-19,318476
-- 2015-05-20,320849
-- 2015-05-21,322912
-- 2015-05-22,325547
-- 2015-05-23,327991
-- 2015-05-24,330188
-- 2015-05-25,332292
-- 2015-05-26,334168
-- 2015-05-27,336265
-- 2015-05-28,338281
-- 2015-05-29,341282
-- 2015-05-30,343769
-- 2015-05-31,345487
-- 2015-06-01,348555
-- 2015-06-02,351005
-- 2015-06-03,352912
-- 2015-06-04,355196
-- 2015-06-05,357896
-- 2015-06-06,360177
-- 2015-06-07,362138
-- 2015-06-08,364403
-- 2015-06-09,366846
-- 2015-06-10,368865
-- 2015-06-11,371515
-- 2015-06-12,373654
-- 2015-06-13,376163
-- 2015-06-14,378022
-- 2015-06-15,380618
-- 2015-06-16,382516
-- 2015-06-17,384653
-- 2015-06-18,386637
-- 2015-06-19,389430
-- 2015-06-20,391491
-- 2015-06-21,393416
-- 2015-06-22,395735
-- 2015-06-23,397778
-- 2015-06-24,400106
-- 2015-06-25,402505
-- 2015-06-26,405251
-- 2015-06-27,408064
-- 2015-06-28,409634
-- 2015-06-29,411508
-- 2015-06-30,413719
-- 2015-07-01,415951
-- 2015-07-02,418246
-- 2015-07-03,421689
-- 2015-07-04,425553
-- 2015-07-05,427144
-- 2015-07-06,429261
-- 2015-07-07,431635
-- 2015-07-08,434031
-- 2015-07-09,436329
-- 2015-07-10,438761
-- 2015-07-11,440847
-- 2015-07-12,443033
-- 2015-07-13,445093
-- 2015-07-14,447049
-- 2015-07-15,449551
-- 2015-07-16,452015
-- 2015-07-17,455147
-- 2015-07-18,457269
-- 2015-07-19,459292
-- 2015-07-20,461793
-- 2015-07-21,463824
-- 2015-07-22,466116
-- 2015-07-23,468330
-- 2015-07-24,471534
-- 2015-07-25,473771
-- 2015-07-26,475643
-- 2015-07-27,477815
-- 2015-07-28,479910
-- 2015-07-29,481833
-- 2015-07-30,484182
-- 2015-07-31,486277
-- 2015-08-01,488718
-- 2015-08-02,490628
-- 2015-08-03,492610
-- 2015-08-04,494700
-- 2015-08-05,496795
-- 2015-08-06,498894
-- 2015-08-07,501520
-- 2015-08-08,504236
-- 2015-08-09,506239
-- 2015-08-10,508378
-- 2015-08-11,510668
-- 2015-08-12,513034
-- 2015-08-13,515108
-- 2015-08-14,518125
-- 2015-08-15,520377
-- 2015-08-16,522516
-- 2015-08-17,525142
-- 2015-08-18,527243
-- 2015-08-19,529576
-- 2015-08-20,531484
-- 2015-08-21,534085
-- 2015-08-22,536491
-- 2015-08-23,538193
-- 2015-08-24,539890
-- 2015-08-25,541849
-- 2015-08-26,544178
-- 2015-08-27,546296
-- 2015-08-28,548943
-- 2015-08-29,550978
-- 2015-08-30,552473
-- 2015-08-31,554554
-- 2015-09-01,556907
-- 2015-09-02,558773
-- 2015-09-03,561026
-- 2015-09-04,563987
-- 2015-09-05,566525
-- 2015-09-06,568017
-- 2015-09-07,570300
-- 2015-09-08,572550
-- 2015-09-09,575130
-- 2015-09-10,577546
-- 2015-09-11,580308
-- 2015-09-12,582896
-- 2015-09-13,584734
-- 2015-09-14,586899
-- 2015-09-15,589449
-- 2015-09-16,591634
-- 2015-09-17,593876
-- 2015-09-18,596598
-- 2015-09-19,598885
-- 2015-09-20,600714
-- 2015-09-21,602845
-- 2015-09-22,605015
-- 2015-09-23,607178
-- 2015-09-26,609425
-- 2015-09-27,611740
-- 2015-09-28,613775
-- 2015-09-29,616537
-- 2015-09-30,618735
-- 2015-10-01,621937
-- 2015-10-02,624012
-- 2015-10-03,626413
-- 2015-10-04,628555
-- 2015-10-06,630771
-- 2015-10-07,632863
-- 2015-10-08,634839
-- 2015-10-09,637352
-- 2015-10-10,639662
-- 2015-10-11,641578
-- 2015-10-13,643904
-- 2015-10-14,646050
-- 2015-10-15,650370
-- 2015-10-16,652925
-- 2015-10-17,655265
-- 2015-10-18,657060
-- 2015-10-20,659497
-- 2015-10-21,661957
-- 2015-10-22,664358
-- 2015-10-23,666969
-- 2015-10-24,669649
-- 2015-10-25,671486
-- 2015-10-27,673475
-- 2015-10-28,675111
-- 2015-10-29,677281
-- 2015-10-30,680018
-- 2015-10-31,682763
-- 2015-11-01,684750
-- 2015-11-02,687049
-- 2015-11-03,688878
-- 2015-11-04,690844
-- 2015-11-05,693024
-- 2015-11-06,696181
-- 2015-11-07,698762
-- 2015-11-08,700872
-- 2015-11-09,703356
-- 2015-11-10,705399
-- 2015-11-11,707345
-- 2015-11-12,709910
-- 2015-11-13,712175
-- 2015-11-14,714500
-- 2015-11-15,716322
-- 2015-11-16,718579
-- 2015-11-17,720536
-- 2015-11-18,722648
-- 2015-11-19,725343
-- 2015-11-20,727731
-- 2015-11-21,729815
-- 2015-11-22,731184
-- 2015-11-23,733649
-- 2015-11-24,735879
-- 2015-11-25,738242
-- 2015-11-26,742648
-- 2015-11-27,747070
-- 2015-11-28,749038
-- 2015-11-29,750937
-- 2015-11-30,753160
-- 2015-12-01,755237
-- 2015-12-02,757451
-- 2015-12-03,759694
-- 2015-12-04,762572
-- 2015-12-05,765200
-- 2015-12-06,767550
-- 2015-12-07,769965
-- 2015-12-08,771821
-- 2015-12-09,774393
-- 2015-12-10,776379
-- 2015-12-11,779013
-- 2015-12-12,780973
-- 2015-12-13,783218
-- 2015-12-14,785391
-- 2015-12-15,787778
-- 2015-12-16,790013
-- 2015-12-17,791894
-- 2015-12-18,794780
-- 2015-12-19,797084
-- 2015-12-20,799189
-- 2015-12-21,801290
-- 2015-12-22,803173
-- 2015-12-23,805417
-- 2015-12-24,807555
-- 2015-12-26,809198
-- 2015-12-27,810617
-- 2015-12-28,812254
-- 2015-12-29,813607
-- 2015-12-30,814945
-- 2015-12-31,817861


-- Top 3 most ordered pizza type based on revenue for each pizza category.
select Category, pizza_name, Revenue 
from (select category, pizza_name, Revenue, Rank() 
 over (PARTITION BY Category order by Revenue) as ranks 
 from (SELECT Category , pizza_name, sum(Quantity*Price) as Revenue FROM 
  pizzas JOIN order_detail ON pizzas.pizza_id = order_detail.pizza_id 
  JOIN ptypes ON ptypes.pizza_type_id = pizzas.pizza_type_id
  JOIN pizza_orders ON pizza_orders.order_id = order_detail.order_id 
  GROUP BY  Category, pizza_name
  ORDER BY Revenue DESC) as rev) as r
 where ranks <= 3;
-- 'Chicken', 'The Chicken Pesto Pizza', '16701.75'
-- 'Chicken', 'The Chicken Alfredo Pizza', '16900.25'
-- 'Chicken', 'The Southwest Chicken Pizza', '34705.75'
-- 'Classic', 'The Pepperoni, Mushroom, and Peppers Pizza', '18834.5'
-- 'Classic', 'The Big Meat Pizza', '22968'
-- 'Classic', 'The Napolitana Pizza', '24087'
-- 'Supreme', 'The Brie Carre Pizza', '11588.499999999898'
-- 'Supreme', 'The Spinach Supreme Pizza', '15277.75'
-- 'Supreme', 'The Calabrese Pizza', '15934.25'
-- 'Veggie', 'The Green Garden Pizza', '13955.75'
-- 'Veggie', 'The Mediterranean Pizza', '15360.5'
-- 'Veggie', 'The Spinach Pesto Pizza', '15596'
 
