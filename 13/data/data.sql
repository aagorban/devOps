INSERT INTO Institutions (institution_name, institution_type, address)
VALUES 
('Школа №1', 'School', 'вул. Шевченка, 10, Київ'),
('Дитячий садок "Сонечко"', 'Kindergarten', 'вул. Лесі Українки, 5, Львів'),
('Гімназія "Обрій"', 'School', 'вул. Франка, 12, Харків');

INSERT INTO Classes (class_name, institution_id, direction)
VALUES 
('1-А клас', 1, 'Mathematics'),
('Біологія 9 клас', 1, 'Biology and Chemistry'),
('Група "Малята"', 2, 'Language Studies'),
('5-Б клас', 3, 'Mathematics'),
('Мовні студії', 3, 'Language Studies');


INSERT INTO Children (first_name, last_name, birth_date, year_of_entry, age, institution_id, class_id)
VALUES 
('Іван', 'Петренко', '2012-05-15', 2019, 12, 1, 1),
('Ольга', 'Шевченко', '2015-07-20', 2020, 9, 1, 2),
('Марія', 'Коваленко', '2018-03-10', 2023, 6, 2, 3),
('Андрій', 'Сидоренко', '2011-01-25', 2018, 13, 3, 4),
('Анастасія', 'Іванова', '2013-11-30', 2019, 10, 3, 5);

INSERT INTO Parents (first_name, last_name, child_id, tuition_fee)
VALUES 
('Олександр', 'Петренко', 1, 1500.00),
('Наталія', 'Шевченко', 2, 1300.00),
('Людмила', 'Коваленко', 3, 1100.00),
('Василь', 'Сидоренко', 4, 1600.00),
('Оксана', 'Іванова', 5, 1200.00);
