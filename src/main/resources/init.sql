insert into PUBLIC.pizzeria_table (name, seats, table_state) values pizzeria_table ('Table 1', 2, 0, 0);
insert into PUBLIC.pizzeria_table (name, seats, table_state) values pizzeria_table ('Table 2', 4, 0, 0);
insert into PUBLIC.pizzeria.pizzeria_table (name, seats, table_state) values pizzeria_table ('Table 3', 1, 0);

insert into product (name, price, tva) values ('Calzone', 13, 5.5);
insert into product (name, price, tva) values ('Regina', 10, 5.5);
insert into product (name, price, tva) values ('Salmon', 9, 5.5);