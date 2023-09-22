
alter table categories 
add primary key   (cat_id) ;

alter table deliveries 
add primary key   (delivery_id) ;

alter table promotions  
add primary key   (promotion_id) ;

alter table calendar  
add primary key   (calendar_id) ;

alter table products 
add primary key   (product_id) ;


alter table customers 
add primary key   (customer_id) ;


alter table order_items 
add primary key   (order_item_id) ;




alter table order_items 
add FOREIGN KEY (Calendar_id) references Calendar (Calendar_id),
add FOREIGN KEY (delivery_id) references deliveries (delivery_id),
add FOREIGN KEY (Customer_ID) references Customers (Customer_ID),
add FOREIGN KEY (Product_ID) references Products (Product_ID);


alter table products 
add foreign key (category_id) references categories (cat_id);




alter table promotions 
modify promotion_id int not null auto_increment;

alter table order_items 
modify promotion_id int ;


alter table order_items 
add foreign key (promotion_id)  references promotions (promotion_id);

-- 
-- 3 Užduotis   -- 3 Tasks

-- 3.1. Kiekvieną savaitę gautų užsakymų skaičių.   -- 3.1. Number of orders received each week.


select c.calendar_week as savaites,  count(*),c2.first_name ,  c2.last_name 
from calendar c
left join order_items oi   on c.calendar_id  = oi.calendar_id 
left join customers c2  on oi.customer_id = c2.customer_id 
where c2.first_name is not null and c2.last_name is not null
group by c.calendar_id,c2.first_name ,  c2.last_name 
order by c.calendar_week 


-- 3.2. Populiariausią, kiekvienos savaitės prekę.   -- 3.2. The most popular product of each week.


select * from products p 

select p.name, count(*) , c.calendar_week 
from products p 
left join order_items oi on p.product_id = oi.product_id 
left join calendar c on oi.calendar_id = c.calendar_id 
group by p.name,c.calendar_week 


-- 3.3Kiekvieno mėnesio, kiekvienos Category_level1_name kategorijos pajamas   -- 3.3Revenues for each month, for each Category_level1_name category

select c.calendar_month,sum(oi.amount_without_vat) as pajamos, c2.cat_level_1_name
from calendar c 
left join order_items oi on c.calendar_id = oi.calendar_id 
left join products p on oi.product_id = p.product_id 
left join categories c2 on p.category_id = c2.cat_id 
where oi.amount_without_vat is not null and c2.cat_level_1_name is not null 
group by c.calendar_month ,c2.cat_level_1_name


-- 3.4Miestų pavadinimus ir ten gyvenančių klientų skaičių.   -- 3.4 Names of cities and the number of customers living there.

select * from customers c 

select c.city , c.first_name ,c.last_name 
from customers c 
group by c.city , c.first_name,c.last_name 


-- 3.5.Miestų pavadinimus ir į tuos miestus siunčiamų užsakymų skaičių.       -- 3.5. Names of cities and the number of orders sent to those cities.
-- a. Išskaidykite užsakymų skaičių pagal delivery status lauką.              -- a. Break down the number of orders by the delivery status field.


select d.city, count(d.delivery_id) as uzsakymu_skaicius, d.delivery_status 
from deliveries d 
left join order_items oi on d.delivery_id =oi.delivery_id 
group by d.city ,d.delivery_status 
order by d.delivery_status  asc


-- 3.6.Raskite, kuri akcija sugeneravo daugiausiai pajamu.             -- 3.6. Find which share generated the most income.


select  p.name , sum(p.cost) as maksimali_suma , count(*) as uzsakymai
from products p 
left join order_items oi on p.product_id = oi.product_id 
group by  p.name
order by maksimali_suma desc
limit 1 ;


-- 3.7. Raskite, kuri akcija sugeneravo daugiausiai nuolaidos.         -- 3.7. Find which promotion generated the most discount.
 
select p.name ,sum(p2.discount) as nuolaida_masimali
from products p 
left join order_items oi on p.product_id = oi.product_id 
left join promotions p2 on oi.promotion_id  = p2.promotion_id 
group by p.name
order by nuolaida_masimali desc
limit 1 ;


-- 4 Užduotis         -- 4 Task

-- Sukurkite laikinas lenteles.         -- Create temporary tables.


-- 1. Lentelė, kuri palygina kaip keitėsi praėjusios savaitės pajamos                            -- 1. A table that compares how the income of the previous week changed
-- lyginant su prieš ją ėjusia                                                                   -- compared to the one before it
-- savaite. Pajamos išskaidytos pagal pirmo lygio kategorijas.                                   -- a week. Income is broken down by first-level categories.



select c2.cat_level_1_name, c.calendar_week, sum(oi.amount_without_vat) as pajamos
from calendar c 
left join order_items oi on c.calendar_id = oi.calendar_id 
left join products p  on  oi.product_id = p.product_id 
left join categories c2  on p.category_id = c2.cat_id 
where c2.cat_level_1_name is not null and oi.amount_without_vat is not null
group by c2.cat_level_1_name, c.calendar_week
order by c.calendar_week asc


select 'Savaite_pries' as savaite_praeita, c.calendar_week, sum(oi.amount_without_vat) as sumos_kaita, c2.cat_level_1_name
from calendar c 
left join order_items oi on c.calendar_id = oi.calendar_id 
left join products p  on  oi.product_id = p.product_id 
left join categories c2  on p.category_id = c2.cat_id 
where c.calendar_week = 51 and c2.cat_level_1_name is not null
group by c.calendar_week , c2.cat_level_1_name
union all
select 'Savaites_uz_Pries' as Dvi_savaites_atgal , c.calendar_week, sum(oi.amount_without_vat) as sumos_kaita,c2.cat_level_1_name
from calendar c 
left join order_items oi on c.calendar_id = oi.calendar_id 
left join products p  on  oi.product_id = p.product_id 
left join categories c2  on p.category_id = c2.cat_id 
where c.calendar_week = 50 and c2.cat_level_1_name is not null
group by c.calendar_week ,c2.cat_level_1_name;


-- 
-- 4.2Lentelė, kuri palygina kaip keitėsi praėjusio mėnesio              -- 4.2 Table that compares how it changed last month
-- pajamos lyginant su prieš jį ėjusiu                                   -- income compared to the previous one
-- mėnesiu. Pajamos išskaidytos pagal pristatymo miestus.                -- a month. Revenue is broken down by delivery cities.


select * from calendar c ;

select 'Gruodis' as menesis, sum(oi.amount_without_vat)as pajamos, c.city , c2.calendar_month
from calendar c2
left join order_items oi on c2.calendar_id = oi.calendar_id 
left join customers c on oi.customer_id = c.customer_id 
where c.city is not null and c2.calendar_month in ('Dec')
group by c.city , c2.calendar_month
union all
select 'Lapkritis' as menesis, sum(oi.amount_without_vat), c.city , c2.calendar_month
from calendar c2
left join order_items oi on c2.calendar_id = oi.calendar_id 
left join customers c on oi.customer_id = c.customer_id 
where c.city is not null and c2.calendar_month in ('Nov')
group by c.city , c2.calendar_month
order by city ;




-- 4.3. Lentelė, kuri lygina, kiek praėjusį mėnesį atsirado naujų klientų                -- 4.3. A table that compares how many new customers were added last month
--  lyginant su prieš jį ėjusiu                                                          -- compared to his predecessor
-- mėnesiu.                                                                              -- a month.


select * from calendar c ;

select c.calendar_month , count(c2.customer_id) as klientu_pokytis
from calendar c 
left join order_items oi on c.calendar_id = oi.calendar_id 
left join customers c2 on oi.customer_id = c2.customer_id 
where c.calendar_month in ('Dec')
group by c.calendar_month
union all
select c.calendar_month , count(c2.customer_id) as klientu_pokytis
from calendar c 
left join order_items oi on c.calendar_id = oi.calendar_id 
left join customers c2 on oi.customer_id = c2.customer_id 
where c.calendar_month in ('Nov')
group by c.calendar_month
order by klientu_pokytis asc



-- 5 Užduotis                                                         -- 5 Tasks
  
-- Sukurkite procedūras.                                              -- Create procedures.

-- 5.1.Procedūrą, kuriai padavus datą, jinai grąžintų tos datos       -- 5.1. The procedure, for which, after submitting a date, it would return that date

-- a.Visų užsakymų skaičių.                                           -- a. The number of all orders.
  
use naujas_projektas_1_1;


select c.calendar_date , c1.customer_id , count(*) as dienos_uzsakymai
from calendar c 
left join order_items oi on c.calendar_id = oi.calendar_id 
left join customers c1 on oi.customer_id = c1.customer_id 
left join products p on oi.product_id = p.product_id 
left join categories c2 on p.category_id = c2.cat_id
where c1.customer_id is not null
group by c.calendar_date , c1.customer_id
order by c.calendar_date asc;

select * from calendar c ;

call klientu_uzsakymas_data('2021-01-24'); 


-- b. Visų užsakymų pajamas.                            -- b. Revenue of all orders.


select c.calendar_date , c1.customer_id , 
sum(oi.amount_without_vat) as pajamos
from calendar c 
left join order_items oi on c.calendar_id = oi.calendar_id 
left join customers c1 on oi.customer_id = c1.customer_id 
left join products p on oi.product_id = p.product_id 
left join categories c2 on p.category_id = c2.cat_id
where c1.customer_id is not null
group by c.calendar_date , c1.customer_id
order by c.calendar_date asc;


call klientu_uzsakymas_pajamos_1('2021-03-13');


-- c. Visų, tos dienos klientų skaičių.                  -- c. Total number of customers for that day.


select c.calendar_date , count(c1.customer_id) as klientu_skaicius
from calendar c 
left join order_items oi on c.calendar_id = oi.calendar_id 
left join customers c1 on oi.customer_id = c1.customer_id 
left join products p on oi.product_id = p.product_id 
left join categories c2 on p.category_id = c2.cat_id
where c1.customer_id is not null
group by c.calendar_date , c1.customer_id
order by c.calendar_date asc;


call klientu_skaicius('2021-03-07');



-- 5.2. Procedūrą, kuriai padavus kliento id, jinai grąžintų                -- 5.2. A procedure that, given the client id, would return it

-- a. Visų kliento užsakymų skaičių.                                        -- a. Number of all customer orders.

select c.customer_id , count(*) kliento_uzsakymai
from customers c 
left join order_items oi on c.customer_id =oi.customer_id 
group by c.customer_id 
order by kliento_uzsakymai asc;

call klientu_uzsakymai_su_id(55);


-- b. Visų užsakymų pajamas                                                -- b. Revenue of all orders

select  count(*), sum(oi.amount_without_vat) as pajamos
from customers c 
left join order_items oi on c.customer_id =oi.customer_id 
group by c.customer_id 
order by pajamos desc;

call uzsakymu_pajamos(10);


-- c. Vidutinę užsakymo vertę.                                              -- c. Average order value.


select  count(*) as uzsakymai, avg(oi.amount_without_vat) as vidutine_verte_uzsakymo
from customers c 
left join order_items oi on c.customer_id =oi.customer_id 
group by c.customer_id 
order by vidutine_verte_uzsakymo desc;


call vidutine_verte_uzsakymo(10) ;



-- d. Vidutinį užsakytų prekių skaičių.                                      -- d. Average number of items ordered.




-- e. Paskutinio užsakymo datą.                                              -- e. The date of the last order.

select c. created_date
from customers c 
order by c.created_date desc limit 1;

call paskutine_data(4) 


-- f. Kliento paskyros sukūrimo amžių dienomis.                               -- f. In the age days of the creation of the customer account.


select created_date,
floor(datediff(current_date, created_date)/365*365) as dienos
from customers c 
order by created_date desc;

call kliento_amzius_dienomis(2);



















































