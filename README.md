# MySQL-
Project mysql for learning purposes
Projektelis mysql mokymosi tikslais

1 Užduotis
Naudodamiesi db_schema.pdf ir duomenų tipais apibrėžtais order_table.xlsx faile sukurkite
duomenų bazės lenteles.
Lentelės turi turėti
1. Order_table.xlsx faile apibrėžtus duomenų tipus. Jeigu duomenų tipas nėra aiškus,
priimkite sprendimą, kuris jums atrodo logiškiausias.
2. Lentelės turi turėti apibrėžtus primary ir foreign keys.
3. Lentelių stulpeliai su reikšmėmis iš sąrašo turi nepriimti neteisingų reikšmių.
P.S. Palyginkite duomenų bazės schemą su duotomis lentelėmis. Gali reikėti pridėti papildomų
stulpelių.


2 Užduotis
Parašykite skriptą, kuris sukeltų folderyje table_data pateiktus duomenis csv failuose į jūsų
sukurtas lenteles.


3 Užduotis
Parašykite sql užklausas, kurios gražintų
1. Kiekvieną savaitę gautų užsakymų skaičių.
2. Populiariausią, kiekvienos savaitės prekę.
3. Kiekvieno mėnesio, kiekvienos Category_level1_name kategorijos pajamas.
4. Miestų pavadinimus ir ten gyvenančių klientų skaičių.
5. Miestų pavadinimus ir į tuos miestus siunčiamų užsakymų skaičių.
a. Išskaidykite užsakymų skaičių pagal delivery status lauką.
6. Raskite, kuri akcija sugeneravo daugiausiai pajamu.
7. Raskite, kuri akcija sugeneravo daugiausiai nuolaidos.



4 Užduotis
Sukurkite laikinas lenteles.
1. Lentelė, kuri palygina kaip keitėsi praėjusios savaitės pajamos lyginant su prieš ją ėjusia
savaite. Pajamos išskaidytos pagal pirmo lygio kategorijas.
2. Lentelė, kuri palygina kaip keitėsi praėjusio mėnesio pajamos lyginant su prieš jį ėjusiu
mėnesiu. Pajamos išskaidytos pagal pristatymo miestus.
3. Lentelė, kuri lygina, kiek praėjusį mėnesį atsirado naujų klientų lyginant su prieš jį ėjusiu
mėnesiu.



5 Užduotis
Sukurkite procedūras.
1. Procedūrą, kuriai padavus datą, jinai grąžintų tos datos
a. Visų užsakymų skaičių.
b. Visų užsakymų pajamas.
c. Visų, tos dienos klientų skaičių.
d. Naujų klientų skaičių (naujas, klientas, kuris yra prisijungęs ne seniau, nei 7
dienos, nuo įvestos datos).
2. Procedūrą, kuriai padavus kliento id, jinai grąžintų
a. Visų kliento užsakymų skaičių.
b. Visų užsakymų pajamas.
c. Vidutinę užsakymo vertę.
d. Vidutinį užsakytų prekių skaičių.
e. Paskutinio užsakymo datą.
f. Kliento paskyros sukūrimo amžių dienomis.




Project mysql for learning purposes

Task 1 Create the database tables using db_schema.pdf and the data types defined in the order_table.xlsx file. Tables must have

Data types defined in order_table.xlsx file. If the data type is not clear, make the decision that makes the most sense to you.
Tables must have defined primary and foreign keys.
Table columns with values from the list must not accept invalid values. P.S. Compare the database schema with the given tables. You may need to add additional columns.
Task 2 Write a script that would convert the data in the table_data folder in the csv files into the tables you created.

Task 3 Write sql queries that would return

Number of orders received each week.
The most popular product of each week.
Income for each month, for each Category_level1_name category.
Names of cities and the number of customers living there.
Names of cities and the number of orders sent to those cities. a. Break down the number of orders by the delivery status field.
Find which stock generated the most revenue.
Find which promotion generated the most discount.

Task 4 Create temporary tables.

A table that compares how last week's income changed compared to the previous week. Income is broken down by first-level categories.
A table that compares how the last month's income changed compared to the previous month. Revenue is broken down by delivery cities.
A table that compares how many new customers were added last month compared to the month before.

Task 5 Create procedures.

A procedure for which, if given a date, it would return a of that date. Number of all orders. b. Revenue of all orders. c. Total number of customers for that day. d. The number of new customers (new, a customer who has logged in no earlier than 7 days from the entered date).
The procedure for which, after submitting the client id, it would return a. Number of all customer orders. b. Revenue of all orders. c. Average order value. d. Average number of items ordered. e. The date of the last order. f. In the age days of the creation of the customer account.
