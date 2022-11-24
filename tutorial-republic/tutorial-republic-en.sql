

CREATE TABLE employees
(
emp_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
, emp_name NVARCHAR ( 55 ) NOT NULL
, hire_date DATE NOT NULL
, salary INTEGER ( 8 ) NOT NULL
, dept_id INTEGER ( 4 )
)
;




INSERT INTO employees
(
  emp_id
, emp_name
, hire_date
, salary
, dept_id
) VALUES
(
  "1"
, "Ethan Hunt"
, "2001-05-01"
, "5000"
, "4"
)
;




INSERT INTO employees
(
  emp_id
, emp_name
, hire_date
, salary
, dept_id
) VALUES
(
  "2"
, "Tony Montana"
, "2002-07-15"
, "6500"
, "1"
)
;




INSERT INTO employees
(
  emp_id
, emp_name
, hire_date
, salary
, dept_id
) VALUES
(
  "3"
, "Sarah Connor"
, "2005-10-18"
, "8000"
, "5"
)
;




INSERT INTO employees
(
  emp_id
, emp_name
, hire_date
, salary
, dept_id
) VALUES
(
  "4"
, "Rick Deckard"
, "2007-01-03"
, "7200"
, "3"
)
;




INSERT INTO employees
(
  emp_id
, emp_name
, hire_date
, salary
, dept_id
) VALUES
(
  "5"
, "Martin Blank"
, "2008-06-24"
, "5600"
, "null"
)
;




INSERT INTO employees
(
  emp_id
, emp_name
, hire_date
, salary
, dept_id
) VALUES
(
  "6"
, "simons bistro"
, "2009-04-01"
, "6000"
, "1"
)
;




INSERT INTO employees
(
  emp_id
, emp_name
, hire_date
, salary
, dept_id
) VALUES
(
  "7"
, "Janet Leverling"
, "2011-04-13"
, "5200"
, "5"
)
;




INSERT INTO employees
(
  emp_id
, emp_name
, hire_date
, salary
, dept_id
) VALUES
(
  "8"
, "Steven Buchanan"
, "2013-05-03"
, "4750"
, "5"
)
;




INSERT INTO employees
(
  emp_id
, emp_name
, hire_date
, salary
, dept_id
) VALUES
(
  "9"
, "Laura Callahan"
, "2015-03-05"
, "3850"
, "null"
)
;




INSERT INTO employees
(
  emp_id
, emp_name
, hire_date
, salary
, dept_id
) VALUES
(
  "10"
, "Nancy Davolio"
, "2016-10-17"
, "4800"
, "3"
)
;




CREATE TABLE departments
(
dept_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
, dept_name NVARCHAR ( 55 ) NOT NULL
)
;




INSERT INTO departments
(
  dept_id
, dept_name
) VALUES
(
  "1"
, "Administration"
)
;




INSERT INTO departments
(
  dept_id
, dept_name
) VALUES
(
  "2"
, "Customer Service"
)
;




INSERT INTO departments
(
  dept_id
, dept_name
) VALUES
(
  "3"
, "Finance"
)
;




INSERT INTO departments
(
  dept_id
, dept_name
) VALUES
(
  "4"
, "Human Resources"
)
;




INSERT INTO departments
(
  dept_id
, dept_name
) VALUES
(
  "5"
, "Sales"
)
;




CREATE TABLE customers
(
cust_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
, cust_name NVARCHAR ( 55 ) NOT NULL
, address NVARCHAR ( 55 ) NOT NULL
, city NVARCHAR ( 55 ) NOT NULL
, postal_code NVARCHAR ( 55 )
, country NVARCHAR ( 55 ) NOT NULL
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "1"
, "Maria Anders"
, "Obere Str.57"
, "Berlin"
, "12209"
, "Germany"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "2"
, "Fran Wilson"
, "C/Araquil
, 67"
, "Madrid"
, "28023"
, "Spain"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "3"
, "Dominique Perrier"
, "25
, rue Lauriston"
, "Paris"
, "75016"
, "France"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "4"
, "Martin Blank"
, "Via Monte Bianco 34"
, "Turin"
, "10100"
, "Italy"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "5"
, "Thomas Hardy"
, "89 Chiaroscuro Rd."
, "Portland"
, "97219"
, "USA"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "6"
, "Christina Aguilera"
, "Gran Va
, 1"
, "Madrid"
, "28001"
, "Spain"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "7"
, "Hanna Moos"
, "Forsterstr.57"
, "Mannheim"
, "68306"
, "Germany"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "8"
, "Frdrique Citeaux"
, "24
, place Klber"
, "Strasbourg"
, "67000"
, "France"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "9"
, "Laurence Lebihan"
, "12
, rue des Bouchers"
, "Marseille"
, "13008"
, "France"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "10"
, "Elizabeth Lincoln"
, "23 Tsawassen Blvd."
, "Tsawassen"
, "T2F 8 M4"
, "Canada"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "11"
, "Victoria Ashworth"
, "Fauntleroy Circus"
, "London"
, "EC2 5 NT"
, "UK"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "12"
, "Patricio Simpson"
, "Cerrito 333"
, "Buenos Aires"
, "1010"
, "Argentina"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "13"
, "Yang Wang"
, "Hauptstr.29"
, "Bern"
, "3012"
, "Switzerland"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "14"
, "Pedro Afonso"
, "Av.dos Lusadas
, 23"
, "Sao Paulo"
, "05432-043"
, "Brazil"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "15"
, "Sven Ottlieb"
, "Walserweg 21"
, "Aachen"
, "52066"
, "Germany"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "16"
, "Ann Devon"
, "35 King George"
, "London"
, "WX3 6 FW"
, "UK"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "17"
, "Roland Mendel"
, "Kirchgasse 6"
, "Graz"
, "8010"
, "Austria"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "18"
, "Aria Cruz"
, "Rua Ors
, 92"
, "Sao Paulo"
, "05442-030"
, "Brazil"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "19"
, "Diego Roel"
, "C/Moralzarzal
, 86"
, "Madrid"
, "28034"
, "Spain"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "20"
, "Maria Larsson"
, "kergatan 24"
, "Brcke"
, "S-844 67"
, "Sweden"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "21"
, "Peter Franken"
, "Berliner Platz 43"
, "Mnchen"
, "80805"
, "Germany"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "22"
, "Carine Schmitt"
, "54
, rue Royale"
, "Nantes"
, "44000"
, "France"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "23"
, "Paolo Accorti"
, "120 Hanover Sq."
, "London"
, "WA1 1 DP"
, "UK"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "24"
, "Jos Pedro Freyre"
, "C/Romero
, 33"
, "Sevilla"
, "41101"
, "Spain"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "25"
, "Andr Fonseca"
, "Av.Brasil
, 442"
, "Campinas"
, "04876-786"
, "Brazil"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "26"
, "Howard Snyder"
, "2732 Baker Blvd."
, "Eugene"
, "97403"
, "USA"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "27"
, "Mario Pontes"
, "Rua do Pao
, 67"
, "Rio de Janeiro"
, "05454-876"
, "Brazil"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "28"
, "Martin Sommer"
, "Maubelstr.90"
, "Brandenburg"
, "14776"
, "Germany"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "29"
, "Yoshi Tannamuri"
, "1900 Oak St."
, "Vancouver"
, "V3F 2 K1"
, "Canada"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "30"
, "John Steel"
, "12 Orchestra Terrace"
, "Walla Walla"
, "99362"
, "USA"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "31"
, "Renate Messner"
, "Magazinweg 7"
, "Frankfurt a.M."
, "60528"
, "Germany"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "32"
, "Jaime Yorres"
, "87 Polk St.Suite 5"
, "San Francisco"
, "94117"
, "USA"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "33"
, "Catherine Dewey"
, "Rue Joseph-Bens 532"
, "Bruxelles"
, "B-1180"
, "Belgium"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "34"
, "Jean Fresnire"
, "43 rue St.Laurent"
, "Montral"
, "H1J 1 C3"
, "Canada"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "35"
, "Alexander Feuer"
, "Heerstr.22"
, "Leipzig"
, "04179"
, "Germany"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "36"
, "Rene Phillips"
, "2743 Bering St."
, "Anchorage"
, "99508"
, "USA"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "37"
, "Henriette Pfalzheim"
, "Mehrheimerstr.369"
, "Kln"
, "50739"
, "Germany"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "38"
, "Georg Pipps"
, "Geislweg 14"
, "Salzburg"
, "5020"
, "Austria"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "39"
, "Horst Kloss"
, "Taucherstrae 10"
, "Cunewalde"
, "01307"
, "Germany"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "40"
, "Paula Wilson"
, "2817 Milton Dr."
, "Albuquerque"
, "87110"
, "USA"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "41"
, "Janete Limeira"
, "Av.Copacabana
, 267"
, "Rio de Janeiro"
, "02389-890"
, "Brazil"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "42"
, "Michael Holz"
, "Grenzacherweg 237"
, "Genve"
, "1203"
, "Switzerland"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "43"
, "Alejandra Camino"
, "Berguvsvgen 8"
, "Lule"
, "S-958 22"
, "Sweden"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "44"
, "Jose Pavarotti"
, "187 Suffolk Ln."
, "Boise"
, "83720"
, "USA"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "45"
, "Hari Kumar"
, "90 Wadhurst Rd."
, "London"
, "OX15 4 NB"
, "UK"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "46"
, "Jytte Petersen"
, "Vinbltet 34"
, "Kobenhavn"
, "1734"
, "Denmark"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "47"
, "Antonio Moreno"
, "Mataderos 2312"
, "Mxico D.F."
, "05023"
, "Mexico"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "48"
, "Art Braunschweiger"
, "P.O.Box 555"
, "Lander"
, "82520"
, "USA"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "49"
, "Pascale Cartrain"
, "Boulevard Tirou
, 255"
, "Charleroi"
, "B-6000"
, "Belgium"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "50"
, "Liu Wong"
, "55 Grizzly Peak Rd."
, "Butte"
, "59801"
, "USA"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "51"
, "Karin Josephs"
, "Luisenstr.48"
, "Mnster"
, "44087"
, "Germany"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "52"
, "Miguel Angel Paolino"
, "Avda.Azteca 123"
, "Mxico D.F."
, "05033"
, "Mexico"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "53"
, "Helvetius Nagy"
, "722 DaVinci Blvd."
, "Kirkland"
, "98034"
, "USA"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "54"
, "Palle Ibsen"
, "Smagsloget 45"
, "Rhus"
, "8200"
, "Denmark"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "55"
, "Mary Saveley"
, "2
, rue du Commerce"
, "Lyon"
, "69004"
, "France"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "56"
, "Paul Henriot"
, "59 rue de Abbaye"
, "Reims"
, "51100"
, "France"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "57"
, "Rita Mller"
, "Adenauerallee 900"
, "Stuttgart"
, "70563"
, "Germany"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "58"
, "Pirkko Koskitalo"
, "Torikatu 38"
, "Oulu"
, "90110"
, "Finland"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "59"
, "Paula Parente"
, "Rua do Mercado
, 12"
, "Resende"
, "08737-363"
, "Brazil"
)
;




INSERT INTO customers
(
  cust_id
, cust_name
, address
, city
, postal_code
, country
) VALUES
(
  "60"
, "Matti Karttunen"
, "Keskuskatu 45"
, "Helsinki"
, "21240"
, "Finland"
)
;




CREATE TABLE orders
(
order_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
, cust_id INTEGER ( 4 ) NOT NULL
, order_date DATE NOT NULL
, order_value DECIMAL NOT NULL
, shipper_id INTEGER ( 4 ) NOT NULL
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10250"
, "54"
, "2014-07-05"
, "1807.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10251"
, "58"
, "2014-07-15"
, "1159"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10252"
, "47"
, "2014-07-18"
, "2822"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10253"
, "10"
, "2014-07-19"
, "2575.3"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10254"
, "22"
, "2014-07-24"
, "1256.25"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10255"
, "20"
, "2014-07-31"
, "9247.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10256"
, "24"
, "2014-08-01"
, "360"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10257"
, "43"
, "2014-08-06"
, "3151.65"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10258"
, "58"
, "2014-08-08"
, "2809"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10259"
, "30"
, "2014-08-14"
, "228"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10260"
, "8"
, "2014-08-14"
, "4715.55"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10261"
, "22"
, "2014-08-15"
, "940"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10262"
, "7"
, "2014-08-22"
, "926.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10263"
, "59"
, "2014-08-23"
, "5783"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10264"
, "60"
, "2014-08-27"
, "1920"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10265"
, "33"
, "2014-08-28"
, "2571"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10266"
, "35"
, "2014-09-02"
, "72"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10267"
, "33"
, "2014-09-03"
, "2695"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10268"
, "18"
, "2014-09-04"
, "165"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10269"
, "4"
, "2014-09-10"
, "1280"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10270"
, "7"
, "2014-09-16"
, "8142.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10271"
, "23"
, "2014-09-17"
, "432"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10272"
, "52"
, "2014-09-18"
, "400"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10273"
, "7"
, "2014-09-24"
, "1741.5"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10274"
, "18"
, "2014-09-30"
, "370"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10275"
, "15"
, "2014-10-01"
, "546"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10276"
, "41"
, "2014-10-03"
, "547.5"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10277"
, "46"
, "2014-10-04"
, "899"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10278"
, "32"
, "2014-10-07"
, "985.25"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10279"
, "57"
, "2014-10-16"
, "937.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10280"
, "22"
, "2014-10-16"
, "1155"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10281"
, "11"
, "2014-10-18"
, "372.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10282"
, "26"
, "2014-10-21"
, "302"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10283"
, "25"
, "2014-11-06"
, "3562.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10284"
, "36"
, "2014-11-07"
, "3274.25"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10285"
, "24"
, "2014-11-08"
, "1874"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10286"
, "57"
, "2014-11-12"
, "3930"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10287"
, "25"
, "2014-11-28"
, "2131.25"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10288"
, "32"
, "2014-11-28"
, "425"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10289"
, "50"
, "2014-12-03"
, "693"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10290"
, "58"
, "2014-12-03"
, "1482.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10291"
, "44"
, "2014-12-05"
, "818"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10292"
, "9"
, "2014-12-10"
, "200"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10293"
, "3"
, "2014-12-12"
, "608.4"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10294"
, "1"
, "2014-12-18"
, "2373.3"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10295"
, "32"
, "2014-12-23"
, "53"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10296"
, "42"
, "2015-01-01"
, "1948.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10297"
, "36"
, "2015-01-08"
, "779"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10298"
, "19"
, "2015-01-10"
, "12773.75"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10299"
, "10"
, "2015-01-13"
, "1911"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10301"
, "24"
, "2015-01-22"
, "675"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10302"
, "5"
, "2015-01-24"
, "405"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10303"
, "42"
, "2015-01-28"
, "3314"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10304"
, "59"
, "2015-01-31"
, "1205"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10305"
, "56"
, "2015-02-04"
, "1905"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10306"
, "13"
, "2015-02-06"
, "832"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10307"
, "45"
, "2015-02-07"
, "750"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10308"
, "21"
, "2015-02-12"
, "377.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10309"
, "28"
, "2015-02-12"
, "195.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10310"
, "34"
, "2015-02-13"
, "1600.9"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10311"
, "51"
, "2015-02-14"
, "556.25"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10312"
, "35"
, "2015-02-19"
, "267.2"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10313"
, "4"
, "2015-02-21"
, "938"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10314"
, "36"
, "2015-02-25"
, "3162"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10315"
, "38"
, "2015-02-25"
, "2411.25"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10316"
, "56"
, "2015-03-03"
, "1310"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10317"
, "55"
, "2015-03-04"
, "2787.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10318"
, "19"
, "2015-03-06"
, "200"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10319"
, "2"
, "2015-03-06"
, "920"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10320"
, "47"
, "2015-03-12"
, "850"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10321"
, "21"
, "2015-03-17"
, "450"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10322"
, "14"
, "2015-03-17"
, "260"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10323"
, "45"
, "2015-03-18"
, "149"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10324"
, "22"
, "2015-03-20"
, "297.85"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10325"
, "8"
, "2015-03-21"
, "5881.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10326"
, "17"
, "2015-03-24"
, "1008.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10327"
, "14"
, "2015-03-27"
, "2042.4"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10328"
, "42"
, "2015-03-28"
, "4590"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10329"
, "12"
, "2015-04-02"
, "966.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10330"
, "6"
, "2015-04-03"
, "1593"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10331"
, "14"
, "2015-04-09"
, "2530"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10332"
, "27"
, "2015-04-14"
, "570"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10333"
, "10"
, "2015-04-16"
, "882.5"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10334"
, "12"
, "2015-04-18"
, "965"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10335"
, "32"
, "2015-04-21"
, "209.6"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10336"
, "51"
, "2015-04-29"
, "1860.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10337"
, "19"
, "2015-05-02"
, "384.3"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10338"
, "18"
, "2015-05-06"
, "7298.4"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10339"
, "29"
, "2015-05-08"
, "1730"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10340"
, "46"
, "2015-05-15"
, "5519.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10341"
, "2"
, "2015-05-16"
, "1116"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10342"
, "52"
, "2015-05-20"
, "400.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10343"
, "34"
, "2015-05-22"
, "11988"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10344"
, "52"
, "2015-05-26"
, "910"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10345"
, "6"
, "2015-05-28"
, "7537.25"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10346"
, "24"
, "2015-06-03"
, "13445.05"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10347"
, "50"
, "2015-06-05"
, "2515"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10348"
, "3"
, "2015-06-10"
, "1046.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10349"
, "16"
, "2015-06-11"
, "262.5"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10350"
, "37"
, "2015-06-13"
, "912"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10351"
, "52"
, "2015-06-25"
, "492"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10352"
, "12"
, "2015-06-26"
, "2030"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10353"
, "30"
, "2015-06-30"
, "1072.5"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10354"
, "24"
, "2015-07-01"
, "1376"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10355"
, "44"
, "2015-07-02"
, "170"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10356"
, "9"
, "2015-07-04"
, "2156.25"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10357"
, "51"
, "2015-07-09"
, "739"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10358"
, "2"
, "2015-07-17"
, "1754"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10359"
, "49"
, "2015-07-18"
, "5772.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10360"
, "23"
, "2015-07-24"
, "6303"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10361"
, "43"
, "2015-07-29"
, "4290.5"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10362"
, "29"
, "2015-07-29"
, "3232.6"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10363"
, "43"
, "2015-07-30"
, "3712"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10364"
, "18"
, "2015-08-05"
, "206"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10365"
, "6"
, "2015-08-14"
, "720"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10366"
, "57"
, "2015-08-19"
, "912"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10367"
, "43"
, "2015-08-22"
, "70"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10368"
, "4"
, "2015-08-26"
, "1578"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10369"
, "32"
, "2015-08-28"
, "2400"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10370"
, "52"
, "2015-08-28"
, "488.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10371"
, "55"
, "2015-09-01"
, "1020"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10372"
, "30"
, "2015-09-03"
, "1581"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10373"
, "17"
, "2015-09-09"
, "4727"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10374"
, "39"
, "2015-09-10"
, "3470"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10375"
, "8"
, "2015-09-18"
, "585"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10376"
, "10"
, "2015-09-22"
, "612.5"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10377"
, "31"
, "2015-09-22"
, "105"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10378"
, "48"
, "2015-09-26"
, "693"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10379"
, "27"
, "2015-10-01"
, "90"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10380"
, "29"
, "2015-10-09"
, "992"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10381"
, "47"
, "2015-10-14"
, "2395.8"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10382"
, "5"
, "2015-10-15"
, "252"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10383"
, "25"
, "2015-10-17"
, "3037.8"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10384"
, "34"
, "2015-10-20"
, "835"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10385"
, "50"
, "2015-10-28"
, "1019.5"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10386"
, "45"
, "2015-10-31"
, "1506"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10387"
, "19"
, "2015-11-07"
, "658.75"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10388"
, "34"
, "2015-11-11"
, "1185.75"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10389"
, "6"
, "2015-11-12"
, "1251.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10390"
, "4"
, "2015-11-12"
, "2337.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10391"
, "31"
, "2015-11-14"
, "2003.75"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10392"
, "3"
, "2015-11-18"
, "418.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10393"
, "40"
, "2015-11-24"
, "1075"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10394"
, "24"
, "2015-11-25"
, "4774"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10395"
, "42"
, "2015-11-25"
, "565"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10396"
, "42"
, "2015-11-27"
, "2209"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10397"
, "14"
, "2015-11-28"
, "1290"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10398"
, "42"
, "2015-12-05"
, "795"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10399"
, "46"
, "2015-12-09"
, "3120"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10400"
, "56"
, "2015-12-10"
, "1350"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10401"
, "53"
, "2015-12-15"
, "2762.5"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10402"
, "15"
, "2015-12-16"
, "2683.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10403"
, "37"
, "2015-12-17"
, "1667.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10404"
, "39"
, "2015-12-18"
, "1956.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10405"
, "27"
, "2015-12-24"
, "3736"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10406"
, "45"
, "2015-12-26"
, "900"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10407"
, "39"
, "2015-12-31"
, "3125.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10408"
, "54"
, "2016-01-01"
, "1687.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10409"
, "12"
, "2016-01-01"
, "1571.75"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10410"
, "49"
, "2016-01-05"
, "438"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10411"
, "55"
, "2016-01-08"
, "1338"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10412"
, "17"
, "2016-01-09"
, "1886.5"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10413"
, "44"
, "2016-01-12"
, "310"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10414"
, "51"
, "2016-01-16"
, "1570"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10415"
, "15"
, "2016-01-19"
, "2358"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10416"
, "1"
, "2016-01-21"
, "485"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10417"
, "40"
, "2016-01-23"
, "2960"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10418"
, "35"
, "2016-01-30"
, "1485.5"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10419"
, "42"
, "2016-02-02"
, "3392.4"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10420"
, "7"
, "2016-02-03"
, "3388"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10421"
, "45"
, "2016-02-04"
, "1099.9"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10422"
, "25"
, "2016-02-06"
, "2052"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10423"
, "33"
, "2016-02-10"
, "91.2"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10424"
, "38"
, "2016-02-11"
, "605"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10425"
, "10"
, "2016-02-12"
, "2911.6"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10426"
, "2"
, "2016-02-12"
, "195"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10427"
, "11"
, "2016-02-13"
, "185.25"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10428"
, "38"
, "2016-02-13"
, "542.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10429"
, "39"
, "2016-02-20"
, "255"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10430"
, "59"
, "2016-02-20"
, "1032.5"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10431"
, "52"
, "2016-02-20"
, "6255"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10432"
, "8"
, "2016-02-24"
, "4425"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10433"
, "19"
, "2016-02-25"
, "1976"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10434"
, "34"
, "2016-02-27"
, "371"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10435"
, "42"
, "2016-03-02"
, "228"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10436"
, "16"
, "2016-03-04"
, "428"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10437"
, "34"
, "2016-03-05"
, "1415.75"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10438"
, "38"
, "2016-03-06"
, "360"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10439"
, "28"
, "2016-03-11"
, "2420"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10440"
, "26"
, "2016-03-12"
, "1356"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10441"
, "42"
, "2016-03-13"
, "6162"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10442"
, "13"
, "2016-03-16"
, "6187.5"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10443"
, "21"
, "2016-03-17"
, "4930"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10444"
, "56"
, "2016-03-18"
, "528"
, "2"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10445"
, "42"
, "2016-03-19"
, "1517"
, "1"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10446"
, "59"
, "2016-03-19"
, "627.9"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10447"
, "10"
, "2016-03-25"
, "1716.25"
, "3"
)
;




INSERT INTO orders
(
  order_id
, cust_id
, order_date
, order_value
, shipper_id
) VALUES
(
  "10448"
, "51"
, "2016-03-27"
, "3760"
, "1"
)
;




CREATE TABLE order_details
(
order_id INTEGER NOT NULL
, product_id INTEGER ( 4 ) NOT NULL
, units INTEGER ( 4 ) NOT NULL
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10250"
, "41"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10250"
, "51"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10250"
, "65"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10251"
, "22"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10251"
, "57"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10251"
, "65"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10252"
, "20"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10252"
, "33"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10252"
, "60"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10253"
, "31"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10253"
, "39"
, "42"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10253"
, "49"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10254"
, "24"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10254"
, "55"
, "21"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10254"
, "74"
, "21"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10255"
, "2"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10255"
, "16"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10255"
, "36"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10255"
, "59"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10256"
, "53"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10256"
, "77"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10257"
, "27"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10257"
, "39"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10257"
, "77"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10258"
, "2"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10258"
, "5"
, "65"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10258"
, "32"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10259"
, "21"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10259"
, "37"
, "1"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10260"
, "41"
, "16"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10260"
, "57"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10260"
, "62"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10260"
, "70"
, "21"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10261"
, "21"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10261"
, "35"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10262"
, "5"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10262"
, "7"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10262"
, "56"
, "2"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10263"
, "16"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10263"
, "24"
, "28"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10263"
, "30"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10263"
, "74"
, "36"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10264"
, "2"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10264"
, "41"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10265"
, "17"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10265"
, "70"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10266"
, "12"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10267"
, "40"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10267"
, "59"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10267"
, "76"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10268"
, "29"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10268"
, "72"
, "4"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10269"
, "33"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10269"
, "72"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10270"
, "36"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10270"
, "43"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10271"
, "33"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10272"
, "20"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10272"
, "31"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10272"
, "72"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10273"
, "10"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10273"
, "31"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10273"
, "33"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10273"
, "40"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10273"
, "76"
, "33"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10274"
, "71"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10274"
, "72"
, "7"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10275"
, "24"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10275"
, "59"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10276"
, "10"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10276"
, "13"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10277"
, "28"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10277"
, "62"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10278"
, "44"
, "16"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10278"
, "59"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10278"
, "63"
, "8"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10278"
, "73"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10279"
, "17"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10280"
, "24"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10280"
, "55"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10280"
, "75"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10281"
, "19"
, "1"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10281"
, "24"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10281"
, "35"
, "4"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10282"
, "30"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10282"
, "57"
, "2"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10283"
, "15"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10283"
, "19"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10283"
, "60"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10283"
, "72"
, "3"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10284"
, "27"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10284"
, "44"
, "21"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10284"
, "60"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10284"
, "67"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10285"
, "1"
, "45"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10285"
, "40"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10285"
, "53"
, "36"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10286"
, "35"
, "100"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10286"
, "62"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10287"
, "16"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10287"
, "34"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10287"
, "46"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10288"
, "54"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10288"
, "68"
, "3"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10289"
, "3"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10289"
, "64"
, "9"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10290"
, "5"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10290"
, "29"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10290"
, "49"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10290"
, "77"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10291"
, "13"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10291"
, "44"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10291"
, "51"
, "2"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10292"
, "20"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10293"
, "18"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10293"
, "24"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10293"
, "63"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10293"
, "75"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10294"
, "1"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10294"
, "17"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10294"
, "43"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10294"
, "60"
, "21"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10294"
, "75"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10295"
, "56"
, "4"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10296"
, "11"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10296"
, "16"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10296"
, "69"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10297"
, "39"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10297"
, "72"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10298"
, "2"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10298"
, "36"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10298"
, "59"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10298"
, "62"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10299"
, "19"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10299"
, "70"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10300"
, "66"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10300"
, "68"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10301"
, "40"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10301"
, "56"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10302"
, "17"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10302"
, "28"
, "28"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10302"
, "43"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10303"
, "40"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10303"
, "65"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10303"
, "68"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10304"
, "49"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10304"
, "59"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10304"
, "71"
, "2"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10305"
, "18"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10305"
, "29"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10305"
, "39"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10306"
, "30"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10306"
, "53"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10306"
, "54"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10307"
, "62"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10307"
, "68"
, "3"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10308"
, "69"
, "1"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10308"
, "70"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10309"
, "4"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10309"
, "6"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10309"
, "42"
, "2"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10309"
, "43"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10309"
, "71"
, "3"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10310"
, "16"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10310"
, "62"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10311"
, "42"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10311"
, "69"
, "7"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10312"
, "28"
, "4"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10312"
, "43"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10312"
, "53"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10312"
, "75"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10313"
, "36"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10314"
, "32"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10314"
, "58"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10314"
, "62"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10315"
, "34"
, "14"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10315"
, "70"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10316"
, "41"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10316"
, "62"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10317"
, "1"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10318"
, "41"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10318"
, "76"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10319"
, "17"
, "8"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10319"
, "28"
, "14"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10319"
, "76"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10320"
, "71"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10321"
, "35"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10322"
, "52"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10323"
, "15"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10323"
, "25"
, "4"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10323"
, "39"
, "4"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10324"
, "16"
, "21"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10324"
, "35"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10324"
, "46"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10324"
, "59"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10324"
, "63"
, "80"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10325"
, "6"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10325"
, "13"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10325"
, "14"
, "9"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10325"
, "31"
, "4"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10325"
, "72"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10326"
, "4"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10326"
, "57"
, "16"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10326"
, "75"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10327"
, "2"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10327"
, "11"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10327"
, "30"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10327"
, "58"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10328"
, "59"
, "9"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10328"
, "65"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10328"
, "68"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10329"
, "19"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10329"
, "30"
, "8"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10329"
, "38"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10329"
, "56"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10330"
, "26"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10330"
, "72"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10331"
, "54"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10332"
, "18"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10332"
, "42"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10332"
, "47"
, "16"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10333"
, "14"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10333"
, "21"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10333"
, "71"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10334"
, "52"
, "8"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10334"
, "68"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10335"
, "2"
, "7"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10335"
, "31"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10335"
, "32"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10335"
, "51"
, "48"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10336"
, "4"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10337"
, "23"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10337"
, "26"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10337"
, "36"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10337"
, "37"
, "28"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10337"
, "72"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10338"
, "17"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10338"
, "30"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10339"
, "4"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10339"
, "17"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10339"
, "62"
, "28"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10340"
, "18"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10340"
, "41"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10340"
, "43"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10341"
, "33"
, "8"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10341"
, "59"
, "9"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10342"
, "2"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10342"
, "31"
, "56"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10342"
, "36"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10342"
, "55"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10343"
, "64"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10343"
, "68"
, "4"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10343"
, "76"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10344"
, "4"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10344"
, "8"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10345"
, "8"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10345"
, "19"
, "80"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10345"
, "42"
, "9"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10346"
, "17"
, "36"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10346"
, "56"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10347"
, "25"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10347"
, "39"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10347"
, "40"
, "4"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10347"
, "75"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10348"
, "1"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10348"
, "23"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10349"
, "54"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10350"
, "50"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10350"
, "69"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10351"
, "38"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10351"
, "41"
, "13"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10351"
, "44"
, "77"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10351"
, "65"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10352"
, "24"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10352"
, "54"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10353"
, "11"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10353"
, "38"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10354"
, "1"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10354"
, "29"
, "4"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10355"
, "24"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10355"
, "57"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10356"
, "31"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10356"
, "55"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10356"
, "69"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10357"
, "10"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10357"
, "26"
, "16"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10357"
, "60"
, "8"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10358"
, "24"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10358"
, "34"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10358"
, "36"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10359"
, "16"
, "56"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10359"
, "31"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10359"
, "60"
, "80"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10360"
, "28"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10360"
, "29"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10360"
, "38"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10360"
, "49"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10360"
, "54"
, "28"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10361"
, "39"
, "54"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10361"
, "60"
, "55"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10362"
, "25"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10362"
, "51"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10362"
, "54"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10363"
, "31"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10363"
, "75"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10363"
, "76"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10364"
, "69"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10364"
, "71"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10365"
, "11"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10366"
, "65"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10366"
, "77"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10367"
, "34"
, "36"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10367"
, "54"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10367"
, "65"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10367"
, "77"
, "7"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10368"
, "21"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10368"
, "28"
, "13"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10368"
, "57"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10368"
, "64"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10369"
, "29"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10369"
, "56"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10370"
, "1"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10370"
, "64"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10370"
, "74"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10371"
, "36"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10372"
, "20"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10372"
, "38"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10372"
, "60"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10372"
, "72"
, "42"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10373"
, "58"
, "80"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10373"
, "71"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10374"
, "31"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10374"
, "58"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10375"
, "14"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10375"
, "54"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10376"
, "31"
, "42"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10377"
, "28"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10377"
, "39"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10378"
, "71"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10379"
, "41"
, "8"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10379"
, "63"
, "16"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10379"
, "65"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10380"
, "30"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10380"
, "53"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10380"
, "60"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10380"
, "70"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10381"
, "74"
, "14"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10382"
, "5"
, "32"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10382"
, "18"
, "9"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10382"
, "29"
, "14"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10382"
, "33"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10382"
, "74"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10383"
, "13"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10383"
, "50"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10383"
, "56"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10384"
, "20"
, "28"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10384"
, "60"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10385"
, "7"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10385"
, "60"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10385"
, "68"
, "8"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10386"
, "24"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10386"
, "34"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10387"
, "24"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10387"
, "28"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10387"
, "59"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10387"
, "71"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10388"
, "45"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10388"
, "52"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10388"
, "53"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10389"
, "10"
, "16"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10389"
, "55"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10389"
, "62"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10389"
, "70"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10390"
, "31"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10390"
, "35"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10390"
, "46"
, "45"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10390"
, "72"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10391"
, "13"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10392"
, "69"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10393"
, "2"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10393"
, "14"
, "42"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10393"
, "25"
, "7"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10393"
, "26"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10393"
, "31"
, "32"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10394"
, "13"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10394"
, "62"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10395"
, "46"
, "28"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10395"
, "53"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10395"
, "69"
, "8"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10396"
, "23"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10396"
, "71"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10396"
, "72"
, "21"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10397"
, "21"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10397"
, "51"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10398"
, "35"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10398"
, "55"
, "120"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10399"
, "68"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10399"
, "71"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10399"
, "76"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10400"
, "29"
, "21"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10400"
, "35"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10400"
, "49"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10401"
, "30"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10401"
, "56"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10401"
, "65"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10401"
, "71"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10402"
, "23"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10402"
, "63"
, "65"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10403"
, "16"
, "21"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10403"
, "48"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10404"
, "26"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10404"
, "42"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10404"
, "49"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10405"
, "3"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10406"
, "1"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10406"
, "21"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10406"
, "28"
, "42"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10406"
, "36"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10406"
, "40"
, "2"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10407"
, "11"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10407"
, "69"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10407"
, "71"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10408"
, "37"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10408"
, "54"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10408"
, "62"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10409"
, "14"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10409"
, "21"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10410"
, "33"
, "49"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10410"
, "59"
, "16"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10411"
, "41"
, "25"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10411"
, "44"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10411"
, "59"
, "9"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10412"
, "14"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10413"
, "1"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10413"
, "62"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10413"
, "76"
, "14"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10414"
, "19"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10414"
, "33"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10415"
, "17"
, "2"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10415"
, "33"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10416"
, "19"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10416"
, "53"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10416"
, "57"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10417"
, "38"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10417"
, "46"
, "2"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10417"
, "68"
, "36"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10417"
, "77"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10418"
, "2"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10418"
, "47"
, "55"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10418"
, "61"
, "16"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10418"
, "74"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10419"
, "60"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10419"
, "69"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10420"
, "9"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10420"
, "13"
, "2"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10420"
, "70"
, "8"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10420"
, "73"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10421"
, "19"
, "4"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10421"
, "26"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10421"
, "53"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10421"
, "77"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10422"
, "26"
, "2"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10423"
, "31"
, "14"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10423"
, "59"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10424"
, "35"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10424"
, "38"
, "49"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10424"
, "68"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10425"
, "55"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10425"
, "76"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10426"
, "56"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10426"
, "64"
, "7"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10427"
, "14"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10428"
, "46"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10429"
, "50"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10429"
, "63"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10430"
, "17"
, "45"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10430"
, "21"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10430"
, "56"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10430"
, "59"
, "70"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10431"
, "17"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10431"
, "40"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10431"
, "47"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10432"
, "26"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10432"
, "54"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10433"
, "56"
, "28"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10434"
, "11"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10434"
, "76"
, "18"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10435"
, "2"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10435"
, "22"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10435"
, "72"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10436"
, "46"
, "5"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10436"
, "56"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10436"
, "64"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10436"
, "75"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10437"
, "53"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10438"
, "19"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10438"
, "34"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10438"
, "57"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10439"
, "12"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10439"
, "16"
, "16"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10439"
, "64"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10439"
, "74"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10440"
, "16"
, "49"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10440"
, "29"
, "24"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10440"
, "61"
, "90"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10441"
, "27"
, "50"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10442"
, "11"
, "30"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10442"
, "54"
, "80"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10442"
, "66"
, "60"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10443"
, "11"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10443"
, "28"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10444"
, "17"
, "10"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10444"
, "26"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10444"
, "35"
, "8"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10445"
, "39"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10445"
, "54"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10446"
, "19"
, "12"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10446"
, "24"
, "20"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10446"
, "31"
, "3"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10446"
, "52"
, "15"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10447"
, "19"
, "40"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10447"
, "65"
, "35"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10447"
, "71"
, "2"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10448"
, "26"
, "6"
)
;




INSERT INTO order_details
(
  order_id
, product_id
, units
) VALUES
(
  "10448"
, "40"
, "20"
)
;




CREATE TABLE categories
(
category_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
, category_name NVARCHAR ( 55 ) NOT NULL
, description TEXT NOT NULL
)
;




INSERT INTO categories
(
  category_id
, category_name
, description
) VALUES
(
  "1"
, "Beverages"
, "Soft drinks
, coffees
, teas
, beers
, and ales"
)
;




INSERT INTO categories
(
  category_id
, category_name
, description
) VALUES
(
  "2"
, "Condiments"
, "Sweet and savory sauces
, relishes
, spreads
, and seasonings"
)
;




INSERT INTO categories
(
  category_id
, category_name
, description
) VALUES
(
  "3"
, "Confections"
, "Desserts
, candies
, and sweet breads"
)
;




INSERT INTO categories
(
  category_id
, category_name
, description
) VALUES
(
  "4"
, "Dairy Products"
, "Cheeses"
)
;




INSERT INTO categories
(
  category_id
, category_name
, description
) VALUES
(
  "5"
, "Grains/Cereals"
, "Breads
, crackers
, pasta
, and cereal"
)
;




INSERT INTO categories
(
  category_id
, category_name
, description
) VALUES
(
  "6"
, "Meat/Poultry"
, "Prepared meats"
)
;




INSERT INTO categories
(
  category_id
, category_name
, description
) VALUES
(
  "7"
, "Produce"
, "Dried fruit and bean curd"
)
;




INSERT INTO categories
(
  category_id
, category_name
, description
) VALUES
(
  "8"
, "Seafood"
, "Seaweed and fish"
)
;




CREATE TABLE products
(
product_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
, product_name NVARCHAR ( 55 ) NOT NULL
, supplier_id INTEGER ( 4 ) NOT NULL
, category_id INTEGER ( 4 ) NOT NULL
, quantity_per_unit NVARCHAR ( 55 ) NOT NULL
, price DECIMAL NOT NULL
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "1"
, "Aniseed Syrup"
, "1"
, "2"
, "12-550 ml bottles"
, "10"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "2"
, "Cajun Seasoning"
, "2"
, "2"
, "48-6 oz jars"
, "22"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "3"
, "Green Tea"
, "1"
, "1"
, "10 boxes x 20 bags"
, "18"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "4"
, "Gumbo Mix"
, "2"
, "2"
, "36 boxes"
, "21.35"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "5"
, "Grandmas Boysenberry Spread"
, "3"
, "2"
, "12-8 oz jars"
, "25"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "6"
, "Uncle Bobs Organic Dried Pears"
, "3"
, "7"
, "12-1 lb pkgs."
, "30"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "7"
, "Northwoods Cranberry Sauce"
, "3"
, "2"
, "12-12 oz jars"
, "40"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "8"
, "Mishi Kobe Niku"
, "4"
, "6"
, "18-500 g pkgs."
, "97"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "9"
, "Ikura"
, "4"
, "8"
, "12-200 ml jars"
, "31"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "10"
, "Queso Cabrales"
, "5"
, "4"
, "1 kg pkg."
, "21"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "11"
, "Queso Manchego La Pastora"
, "5"
, "4"
, "10-500 g pkgs."
, "38"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "12"
, "Konbu"
, "6"
, "8"
, "2 kg box"
, "6"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "13"
, "Tofu"
, "6"
, "7"
, "40-100 g pkgs."
, "23.25"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "14"
, "Genen Shouyu"
, "6"
, "2"
, "24-250 ml bottles"
, "15.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "15"
, "Pavlova"
, "7"
, "3"
, "32-500 g boxes"
, "17.45"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "16"
, "Alice Mutton"
, "7"
, "6"
, "20-1 kg tins"
, "39"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "17"
, "Carnarvon Tigers"
, "7"
, "8"
, "16 kg pkg."
, "62.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "18"
, "Teatime Chocolate Biscuits"
, "8"
, "3"
, "10 boxes x 12 pieces"
, "9.2"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "19"
, "Rodneys Marmalade"
, "8"
, "3"
, "30 gift boxes"
, "81"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "20"
, "Rodneys Scones"
, "8"
, "3"
, "24 pkgs.x 4 pieces"
, "10"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "21"
, "Gustafs Knckebrd"
, "9"
, "5"
, "24-500 g pkgs."
, "21"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "22"
, "Tunnbrd"
, "9"
, "5"
, "12-250 g pkgs."
, "9"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "23"
, "Guaran Fantstica"
, "10"
, "1"
, "12-355 ml cans"
, "4.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "24"
, "Gumbr Gummibrchen"
, "11"
, "3"
, "100-250 g bags"
, "31.25"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "25"
, "Schoggi Schokolade"
, "11"
, "3"
, "100-100 g pieces"
, "43"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "26"
, "Rssle Sauerkraut"
, "12"
, "7"
, "25-825 g cans"
, "45.6"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "27"
, "Thringer Rostbratwurst"
, "12"
, "6"
, "50 bags x 30 sausgs."
, "123.75"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "28"
, "Nord-Ost Matjeshering"
, "13"
, "8"
, "10-200 g glasses"
, "25"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "29"
, "Gorgonzola Telino"
, "14"
, "4"
, "12-100 g pkgs"
, "12.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "30"
, "Mascarpone Fabioli"
, "14"
, "4"
, "24-200 g pkgs."
, "32"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "31"
, "Geitost"
, "15"
, "4"
, "500 g"
, "2.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "32"
, "Sasquatch Ale"
, "16"
, "1"
, "24-12 oz bottles"
, "14"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "33"
, "Steeleye Stout"
, "16"
, "1"
, "24-12 oz bottles"
, "18"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "34"
, "Inlagd Sill"
, "17"
, "8"
, "24-250 g jars"
, "19"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "35"
, "Gravad lax"
, "17"
, "8"
, "12-500 g pkgs."
, "26"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "36"
, "Cte de Blaye"
, "18"
, "1"
, "12-75 cl bottles"
, "263.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "37"
, "Chartreuse verte"
, "18"
, "1"
, "750 cc per bottle"
, "18"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "38"
, "Boston Crab Meat"
, "19"
, "8"
, "24-4 oz tins"
, "18.4"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "39"
, "Jacks New England Clam Chowder"
, "19"
, "8"
, "12-12 oz cans"
, "9.65"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "40"
, "Singaporean Hokkien Fried Mee"
, "20"
, "5"
, "32-1 kg pkgs."
, "14"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "41"
, "Ipoh Coffee"
, "20"
, "1"
, "16-500 g tins"
, "46"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "42"
, "Gula Malacca"
, "20"
, "2"
, "20-2 kg bags"
, "19.45"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "43"
, "Rogede sild"
, "21"
, "8"
, "1 k pkg."
, "9.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "44"
, "Spegesild"
, "21"
, "8"
, "4-450 g glasses"
, "12"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "45"
, "Zaanse koeken"
, "22"
, "3"
, "10-4 oz boxes"
, "9.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "46"
, "Chocolade"
, "22"
, "3"
, "10 pkgs."
, "12.75"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "47"
, "Maxilaku"
, "23"
, "3"
, "24-50 g pkgs."
, "20"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "48"
, "Valkoinen suklaa"
, "23"
, "3"
, "12-100 g bars"
, "16.25"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "49"
, "Manjimup Dried Apples"
, "24"
, "7"
, "50-300 g pkgs."
, "53"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "50"
, "Filo Mix"
, "24"
, "5"
, "16-2 kg boxes"
, "7"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "51"
, "Perth Pasties"
, "24"
, "6"
, "48 pieces"
, "32.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "52"
, "Tourtire"
, "25"
, "6"
, "16 pies"
, "7.45"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "53"
, "Pt chinois"
, "25"
, "6"
, "24 boxes x 2 pies"
, "24"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "54"
, "Gnocchi di nonna Alice"
, "9"
, "5"
, "24-250 g pkgs."
, "38"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "55"
, "Ravioli Angelo"
, "5"
, "5"
, "24-250 g pkgs."
, "19.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "56"
, "Escargots de Bourgogne"
, "2"
, "8"
, "24 pieces"
, "13.25"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "57"
, "Raclette Courdavault"
, "13"
, "4"
, "5 kg pkg."
, "55"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "58"
, "Camembert Pierrot"
, "10"
, "4"
, "15-300 g rounds"
, "34"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "59"
, "Sirop drable"
, "13"
, "2"
, "24-500 ml bottles"
, "28.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "60"
, "Tarte au sucre"
, "15"
, "3"
, "48 pies"
, "49.3"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "61"
, "Vegie-spread"
, "7"
, "2"
, "15-625 g jars"
, "43.9"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "62"
, "Wimmers gute Semmelkndel"
, "12"
, "5"
, "20 bags x 4 pieces"
, "33.25"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "63"
, "Louisiana Fiery Hot Pepper Sauce"
, "2"
, "2"
, "32-8 oz bottles"
, "21.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "64"
, "Louisiana Hot Spiced Okra"
, "2"
, "2"
, "24-8 oz jars"
, "17"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "65"
, "Laughing Lumberjack Lager"
, "16"
, "1"
, "24-12 oz bottles"
, "14"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "66"
, "Scottish Longbreads"
, "8"
, "3"
, "10 boxes x 8 pieces"
, "12.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "67"
, "Gudbrandsdalsost"
, "15"
, "4"
, "10 kg pkg."
, "36"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "68"
, "Outback Lager"
, "7"
, "1"
, "24-355 ml bottles"
, "15"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "69"
, "Flotemysost"
, "15"
, "4"
, "10-500 g pkgs."
, "21.5"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "70"
, "Mozzarella di Giovanni"
, "14"
, "4"
, "24-200 g pkgs."
, "34.8"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "71"
, "Rd Kaviar"
, "17"
, "8"
, "24-150 g jars"
, "15"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "72"
, "Longlife Tofu"
, "4"
, "7"
, "5 kg pkg."
, "10"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "73"
, "Rhnbru Klosterbier"
, "12"
, "1"
, "24-0.5 l bottles"
, "7.75"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "74"
, "Lakkalikri"
, "23"
, "1"
, "500 ml"
, "18"
)
;




INSERT INTO products
(
  product_id
, product_name
, supplier_id
, category_id
, quantity_per_unit
, price
) VALUES
(
  "75"
, "Original Frankfurter grne Soe"
, "12"
, "2"
, "12 boxes"
, "13"
)
;




CREATE TABLE suppliers
(
supplier_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
, supplier_name NVARCHAR ( 55 ) NOT NULL
, contact_name NVARCHAR ( 55 ) NOT NULL
, address NVARCHAR ( 255 ) NOT NULL
, city NVARCHAR ( 55 ) NOT NULL
, postal_code NVARCHAR ( 55 ) NOT NULL
, country NVARCHAR ( 55 ) NOT NULL
, phone NVARCHAR ( 55 ) NOT NULL
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "1"
, "Exotic Liquids"
, "Charlotte Cooper"
, "49 Gilbert St."
, "London"
, "EC1 4 SD"
, "UK"
, "( 171 ) 555-2222"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "2"
, "New Orleans Cajun Delights"
, "Shelley Burke"
, "P.O.Box 78934"
, "New Orleans"
, "70117"
, "USA"
, "( 100 ) 555-4822"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "3"
, "Grandma Kellys Homestead"
, "Regina Murphy"
, "707 Oxford Rd."
, "Ann Arbor"
, "48104"
, "USA"
, "( 313 ) 555-5735"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "4"
, "Tokyo Traders"
, "Yoshi Nagase"
, "9-8 Sekimai Musashino-shi"
, "Tokyo"
, "100"
, "Japan"
, "( 03 ) 3555-5011"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "5"
, "Mayumis"
, "Mayumi Ohno"
, "92 Setsuko Chuo-ku"
, "Osaka"
, "545"
, "Japan"
, "( 06 ) 431-7877"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "6"
, "Pavlova
, Ltd."
, "Ian Devling"
, "74 Rose St.Moonie Ponds"
, "Melbourne"
, "3058"
, "Australia"
, "( 03 ) 444-2343"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "7"
, "Specialty Biscuits
, Ltd."
, "Peter Wilson"
, "29 Kings Way"
, "Manchester"
, "M14 GSD"
, "UK"
, "( 161 ) 555-4448"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "8"
, "PB Knckebrd AB"
, "Lars Peterson"
, "Kaloadagatan 13"
, "Gteborg"
, "S-345 67"
, "Sweden"
, "031-987 65 43"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "9"
, "Refrescos Americanas LTDA"
, "Carlos Diaz"
, "Av.das Americanas 12.890"
, "So Paulo"
, "5442"
, "Brazil"
, "( 11 ) 555 4640"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "10"
, "Heli Swaren GmbH&Co.KG"
, "Petra Winkler"
, "Tiergartenstrae 5"
, "Berlin"
, "10785"
, "Germany"
, "( 010 ) 9984510"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "11"
, "Formaggi Fortini s.r.l."
, "Elio Rossi"
, "Viale Dante
, 75"
, "Ravenna"
, "48100"
, "Italy"
, "( 0544 ) 60323"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "12"
, "Norske Meierier"
, "Beate Vileid"
, "Hatlevegen 5"
, "Sandvika"
, "1320"
, "Norway"
, "( 0 ) 2-953010"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "13"
, "Bigfoot Breweries"
, "Cheryl Saylor"
, "3400-8 th Avenue Suite 210"
, "Bend"
, "97101"
, "USA"
, "( 503 ) 555-9931"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "14"
, "Svensk Sjfda AB"
, "Michael Bjrn"
, "Brovallavgen 231"
, "Stockholm"
, "S-123 45"
, "Sweden"
, "08-123 45 67"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "15"
, "Aux joyeux ecclsiastiques"
, "Guylne Nodier"
, "203
, Rue des Francs-Bourgeois"
, "Paris"
, "75004"
, "France"
, "( 1 ) 03.83.00.68"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "16"
, "New England Seafood Cannery"
, "Robb Merchant"
, "Order Processing Dept.2100 Paul Revere Blvd."
, "Boston"
, "02134"
, "USA"
, "( 617 ) 555-3267"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "17"
, "Leka Trading"
, "Chandra Leka"
, "471 Serangoon Loop
, Suite#402"
, "Singapore"
, "0512"
, "Singapore"
, "555-8787"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "18"
, "Lyngbysild"
, "Niels Petersen"
, "Lyngbysild Fiskebakken 10"
, "Lyngby"
, "2800"
, "Denmark"
, "43844108"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "19"
, "Zaanse Snoepfabriek"
, "Dirk Luchte"
, "Verkoop Rijnweg 22"
, "Zaandam"
, "9999 ZZ"
, "Netherlands"
, "( 12345 ) 1212"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "20"
, "Karkki Oy"
, "Anne Heikkonen"
, "Valtakatu 12"
, "Lappeenranta"
, "53120"
, "Finland"
, "( 953 ) 10956"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "21"
, "Gday
, Mate"
, "Wendy Mackenzie"
, "170 Prince Edward Parade Hunters Hill"
, "Sydney"
, "2042"
, "Australia"
, "( 02 ) 555-5914"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "22"
, "Ma Maison"
, "Jean-Guy Lauzon"
, "2960 Rue St.Laurent"
, "Montral"
, "H1J 1 C3"
, "Canada"
, "( 514 ) 555-9022"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "23"
, "Escargots Nouveaux"
, "Marie Delamare"
, "22
, rue H.Voiron"
, "Montceau"
, "71300"
, "France"
, "85.57.00.07"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "24"
, "Gai pturage"
, "Eliane Noz"
, "Bat.B 3
, rue des Alpes"
, "Annecy"
, "74000"
, "France"
, "38.76.98.06"
)
;




INSERT INTO suppliers
(
  supplier_id
, supplier_name
, contact_name
, address
, city
, postal_code
, country
, phone
) VALUES
(
  "25"
, "Forts drables"
, "Chantal Goulet"
, "148 rue Chasseur"
, "Ste-Hyacinthe"
, "J2S 7 S8"
, "Canada"
, "( 514 ) 555-2955"
)
;




CREATE TABLE shippers
(
shipper_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
, shipper_name NVARCHAR ( 55 ) NOT NULL
, phone NVARCHAR ( 55 ) NOT NULL
)
;




INSERT INTO shippers
(
  shipper_id
, shipper_name
, phone
) VALUES
(
  "1"
, "Speedy Express"
, "( 503 ) 555-9831"
)
;




INSERT INTO shippers
(
  shipper_id
, shipper_name
, phone
) VALUES
(
  "2"
, "United Package"
, "( 503 ) 555-3199"
)
;




INSERT INTO shippers
(
  shipper_id
, shipper_name
, phone
) VALUES
(
  "3"
, "Federal Shipping"
, "( 503 ) 555-9931"
)
;




CREATE TABLE trainees
(
id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
, first_name NVARCHAR ( 55 ) NOT NULL
, last_name NVARCHAR ( 55 ) NOT NULL
, birth_date DATE NOT NULL
, gender NVARCHAR ( 1 ) NOT NULL
)
;




INSERT INTO trainees
(
  id
, first_name
, last_name
, birth_date
, gender
) VALUES
(
  "1"
, "Peter"
, "Parker"
, "1998-03-04"
, "M"
)
;




INSERT INTO trainees
(
  id
, first_name
, last_name
, birth_date
, gender
) VALUES
(
  "2"
, "Harry"
, "Potter"
, "2001-08-30"
, "M"
)
;




INSERT INTO trainees
(
  id
, first_name
, last_name
, birth_date
, gender
) VALUES
(
  "3"
, "Peter"
, "Pan"
, "2004-09-19"
, "M"
)
;




INSERT INTO trainees
(
  id
, first_name
, last_name
, birth_date
, gender
) VALUES
(
  "4"
, "Alice"
, "Kingsleigh"
, "1999-07-02"
, "F"
)
;




INSERT INTO trainees
(
  id
, first_name
, last_name
, birth_date
, gender
) VALUES
(
  "5"
, "John"
, "Connor"
, "2002-01-15"
, "M"
)
;
