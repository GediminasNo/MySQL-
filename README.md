# MySQL-
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
