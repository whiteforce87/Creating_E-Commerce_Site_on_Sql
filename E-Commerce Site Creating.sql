create table Campaign (6,'A010','sale_on_table','15-NOV-21','01-DEC-21' NUMBER (10),campaign_code VARCHAR2(15) NOT NULL, campaign_name VARCHAR2(15) NOT NULL, start_date DATE NOT NULL, 
finish_date DATE NOT NULL, constraint ca_cam_pk PRIMARY KEY (campaign_id));

create table Address (address_id NUMBER (10), city VARCHAR2(20) NOT NULL, district VARCHAR2(20) NOT NULL, address VARCHAR2(45) NOT NULL, zip_code NUMBER(10), 
constraint ad_ad_pk PRIMARY KEY (address_id));

create table Product(product_id NUMBER(10), campaign_id NUMBER (10), title VARCHAR2(15) NOT NULL, 
selling_price NUMBER(10,2) NOT NULL, genre VARCHAR2(15) NOT NULL, description VARCHAR2(25) NOT NULL, constraint pr_prd_pk
PRIMARY KEY (product_id), constraint ca_id_fk FOREIGN KEY (campaign_id) REFERENCES Campaign (campaign_id));

create table Comments (comment_id NUMBER (10), product_id NUMBER (10), comment_detail VARCHAR2(60) NOT NULL, rating VARCHAR2(10), comment_date DATE NOT NULL, 
constraint co_com_pk PRIMARY KEY (comment_id), constraint pr_prd_id FOREIGN KEY (product_id) references Product(product_id));

create table Customer(customer_id NUMBER(10), address_id NUMBER (10), comment_id NUMBER(10), first_name VARCHAR2(15) NOT NULL, 
last_name VARCHAR2(15) NOT NULL, email VARCHAR2(30) NOT NULL, phone_number NUMBER(15) NOT NULL, password VARCHAR2(20) NOT NULL, constraint cust_id_pk
PRIMARY KEY (customer_id), constraint add_id_fk FOREIGN KEY (address_id) REFERENCES Address (address_id), constraint com_id_fk FOREIGN KEY (comment_id)
references Comments (comment_id), constraint em_uk UNIQUE (email));

create table Credit_Card (credit_card_id NUMBER(10), card_number NUMBER (20) NOT NULL, customer_full_name VARCHAR2(30) NOT NULL, 
expire_date DATE NOT NULL, card_genre VARCHAR2(10) NOT NULL, constraint cc_crd_pk
PRIMARY KEY (credit_card_id), constraint cc_gnr check (card_genre in ('VISA', 'MASTER','AMEX')));

create table Payment(payment_id NUMBER(10), credit_card_id NUMBER(10), amount NUMBER(10,2) NOT NULL, 
invoice_details VARCHAR2(60), payment_date DATE NOT NULL, constraint pa_pym_pk PRIMARY KEY (payment_id), constraint cc_crd_fk FOREIGN KEY (credit_card_id)
REFERENCES Credit_Card (credit_card_id));

create table Shipping (shipping_id NUMBER(10), address_id NUMBER(10) NOT NULL, shipping_charge NUMBER(10,2) NOT NULL, cargo_name VARCHAR(15) NOT NULL, 
shipping_date DATE NOT NULL, constraint sh_shp_pk PRIMARY KEY (shipping_id), constraints ad_ad_fk FOREIGN KEY (address_id)
references Address (address_id));

create table Orders(order_id NUMBER(10), customer_id NUMBER(10) NOT NULL, payment_id NUMBER(10) NOT NULL, shipping_id NUMBER (10) NOT NULL, order_date DATE NOT NULL,
constraint or_ord_pk PRIMARY KEY (order_id), constraint cu_cus_fk FOREIGN KEY (customer_id) REFERENCES Customer (customer_id),constraint pa_pym_fk FOREIGN KEY (payment_id) REFERENCES Payment (payment_id),
constraint sp_shp_fk FOREIGN KEY (shipping_id) REFERENCES Shipping (Shipping_id));

create table Order_Details (order_details_id NUMBER(10), order_id NUMBER(10) NOT NULL, product_id NUMBER(10) NOT NULL, quantity NUMBER(10) NOT NULL, details VARCHAR2 (45) NOT NULL,
effective_price NUMBER (10,2) NOT NULL, constraint or_ordd_pk PRIMARY KEY (order_details_id) ,constraint or_ord_fk FOREIGN KEY (order_id) REFERENCES Orders (order_id),
constraint pr_prd_fk FOREIGN KEY (product_id) references Product(product_id));

create table Merchant (merchant_id NUMBER(10), merchant_name VARCHAR2(15) NOT NULL, address VARCHAR2(45) NOT NULL, email VARCHAR2(25) NOT NULL, phone_number Number(15) NOT NULL,
constraint mr_mrc_pk PRIMARY KEY (merchant_id) ,constraint mr_em_uk UNIQUE (email));

create table Product_Merchant (product_merchant_id NUMBER(10), merchant_id NUMBER(10) NOT NULL, product_id NUMBER(10) NOT NULL, product_name VARCHAR2(15) NOT NULL, stock NUMBER(10) NOT NULL,
purchase_price NUMBER(10,2) NOT NULL, constraint pm_pmrc_pk PRIMARY KEY (product_merchant_id), constraint pm_mi_fk FOREIGN KEY (merchant_id) references Merchant (merchant_id),
constraint pm_pi_fk FOREIGN KEY (product_id) references Product(product_id));

insert into Campaign values (1,'A010','sale_on_tablets','15-NOV-21','01-DEC-21');
insert into Campaign values (2,'A011','cheap_computers','15-NOV-21','10-DEC-21');
insert into Campaign values (3,'A012','lcd_tvs','15-NOV-21','15-DEC-21');
insert into Campaign values (4,'A013','change_phones','15-NOV-21','20-DEC-21');
insert into Campaign values (5,'A014','gift_cameras','15-NOV-21','25-DEC-21');

insert into Address values (1,'istanbul','Besiktas','Barbaros bul. 102 sok. no.5 d.9',34738);
insert into Address values (2,'izmir','Alsancak','Ataturk bul. 1881 sok. no.19 d.23',35687);
insert into Address values (3,'Paris','Montreuil','Le man st. Moncher apt. no.3/4',876454);
insert into Address values (4,'New York','Garment','Ellen st. Golden apt. no.11/8',556788);
insert into Address values (5,'London','Chelsea','Edinburg st. Bride apt. no.9/4',111355);

insert into Product values (1,1,'tablet',2000,'electronic','lenova 10 inc 1280x800 3gb 32gb');
insert into Product values (2,2,'computer',13000,'electronic','dell 8 cr 2ghz 16 inch 1tb 8gb');
insert into Product values (3,3,'tv',6000,'electronic','lg lcd 65 inch 4k lg');
insert into Product values (4,4,'phone',10000,'electronic','iphone 10 5.85 inch');
insert into Product values (5,5,'camera',4000,'electronic','4k go pro8');

insert into Comments values (1,1,'very fast and high quality',5,'15-NOV-21');
insert into Comments values (2,2,'best for gaming',4,'15-NOV-21');
insert into Comments values (3,3,'a cheap smart tv',4,'16-NOV-21');
insert into Comments values (4,4,'so ergonomic and cool',4,'17-NOV-21');
insert into Comments values (5,5,'a high quality cam',5,'18-NOV-21');

insert into Customer values (1,1,1,'Fatih','AKGUC','fatih_akguc@hotmail.com',00905077690905,'fatih9876!');
insert into Customer values (2,2,2,'Merve','AKSU','merve_aksu@gmail.com',00905788789964,'aksu4991.');
insert into Customer values (3,3,3,'George','DOCKER','george_docker@gmail.com',00495679123,'doge433-');
insert into Customer values (4,4,4,'Julia','ROBERTS','julia_roberts@gmail.com',00107223341,'jr1986_ny');
insert into Customer values (5,5,5,'Ben','MARSHALL','ben_marshall@gmail.com',00389871224,'ben1970marshall,');

insert into Credit_Card values (1,3145778965432819,'Fatih AKGUC','01-JAN-28','VISA');
insert into Credit_Card values (2,2457898765432221,'Merve AKSU','10-MAY-30','MASTER');
insert into Credit_Card values (3,3987909876763354,'George DOCKER','13-FEB-24','AMEX');
insert into Credit_Card values (4,4451237890760019,'Julia ROBERTS','02-MAR-29','VISA');
insert into Credit_Card values (5,5519008767651125,'Ben MARSHALL','03-SEP-27','AMEX');

insert into Payment values (1,1,2000,'2000 payed from credit card from **19','17-NOV-21');
insert into Payment values (2,2,13000,'13000 payed from credit card from **21','16-NOV-21');
insert into Payment values (3,3,6000,'6000 payed from credit card from **54','15-NOV-21');
insert into Payment values (4,4,10000,'10000 payed from credit card from **19','15-NOV-21');
insert into Payment values (5,5,4000,'4000 payed from credit card from **25','15-NOV-21');

insert into Shipping values (1,1,25,'aras','18-NOV-21');
insert into Shipping values (2,2,50,'mng','17-NOV-21');
insert into Shipping values (3,3,200,'ups','16-NOV-21');
insert into Shipping values (4,4,400,'ups','16-NOV-21');
insert into Shipping values (5,5,250,'ups','16-NOV-21');

insert into Orders values (1,1,1,1,'17-NOV-21');
insert into Orders values (2,2,2,2,'16-NOV-21');
insert into Orders values (3,3,3,3,'15-NOV-21');
insert into Orders values (4,4,4,4,'15-NOV-21');
insert into Orders values (5,5,5,5,'15-NOV-21');

insert into Order_Details values (1,1,1,1,'%10 discount with A010 campaign code',1825);
insert into Order_Details values (2,2,2,1,'%10 discount with A011 campaign code',11750);
insert into Order_Details values (3,3,3,1,'%10 discount with A012 campaign code',5600);
insert into Order_Details values (4,4,4,1,'%10 discount with A013 campaign code',9400);
insert into Order_Details values (5,5,5,1,'%10 discount with A014 campaign code',3850);

insert into Merchant values (1,'AliDigital','Dogubank no.11 Sirkeci Istanbul','ali_bilir@hotmail.com',00908581149);
insert into Merchant values (2,'Ayse Elektronik','Cumhuriyet cad. no.9 Izmir','ayse_ozal@gmail.com',00904381115);
insert into Merchant values (3,'CemBilisim','Dogubank no.38 Sirkeci Istanbul','cem_kaz@yahoo.com',00907789892);
insert into Merchant values (4,'OnurSistem','Baris cad no.9 Kizilay Ankara','o.ak49.gamil.com',00908765534);
insert into Merchant values (5,'TeknoFat','Elektronik carsısı no.15 Kadıkoy Istanbul','derya-yigit@gmail.com',00903367787);

insert into Product_Merchant values (1,1,1,'tablet',500,1500);
insert into Product_Merchant values (2,2,2,'computer',200,10000);
insert into Product_Merchant values (3,3,3,'tv',80,5000);
insert into Product_Merchant values (4,4,4,'phone',400,8500);
insert into Product_Merchant values (5,5,5,'camera',100,3000);
