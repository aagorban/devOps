INSERT INTO "users" ("username", "email", "password") VALUES
  ('admin', 'admin@ukr.net', 'ypMEd9FwvtlOjcvH94iICQ==:V6LnSOVwXzENxeLCJk59Toadea7oaA1IxYulAOtKkL9tBxjEPOw085vYalEdLDoe8xbrXQlhh7QRGzrSe8Bthw=='),
  ('marcus', 'marcus@ukr.net', 'dpHw0OUNBz76nuqrXZbeYQ==:wpvUVgi8Yp9rJ0yZyBWecaWP2EL/ahpxZY74KOVfhAYbAZSq6mWqjsQwtCvIPcSKZqUVpVb13JcSciB2fA+6Tg=='),
  ('user', 'user@ukr.net', 'r8zb8AdrlPSh5wNy6hqOxg==:HyO5rvOFLtwzU+OZ9qFi3ADXlVccDJWGSfUS8mVq43spJ6sxyliUdW3i53hOPdkFAtDn3EAQMttOlIoJap1lTQ=='),
  ('iskandar', 'iskandar@ukr.net', 'aqX1O4bKXiwC/Jh2EKNIYw==:bpE4TARNg09vb2Libn1c00YRxcvoklB9zVSbD733LwQQFUuAm7WHP85PbZXwEbbeOVPIFHgflR4cvEmvYkr76g==');

-- Examples login/password
-- admin/123456
-- marcus/marcus
-- user/nopassword
-- iskandar/zulqarnayn
INSERT INTO "books" ("title", "description", "author", "img") VALUES 
('Книга Скарби України: Культурна спадщина нації', 'Ця книжка — максимально сконцентрована презентація найяскравіших витворів українського мистецтва в контексті історії, що створювалася насамперед для читача, який має мінімум знань про Україну й українців. Повномасштабне вторгнення РФ в Україну, задекларованою метою якого було зникнення нашої держави й нас як нації, і потужний, несподіваний для багатьох друзів, а тим паче ворогів, спротив українського війська та громадян спонукали іноземців, і дослідників, і звичайних людей, дізнаватися більше про українську культуру.', 'Андрій Курков', 'https://static.yakaboo.ua/media/cloudflare/product/webp/600x840/2/0/2031_1.jpg'),
('Книга За пів кроку до перемоги', 'З-поміж значної кількості літератури про Західно-Українську Народну Республіку ця книга є унікальною. Адже вона поєднала наукове дослідження історії Галицької Армії та особистий досвід автора, здобутий під час сьогоднішньої російсько-української війни на Донбасі. Михайло Галущак проводить численні історичні паралелі у війні з Польщею століття тому й сучасною війною з Росією. Основою праці стала захищена кандидатська дисертація на тему «Військово-політична думка ЗУНР/ ЗОУНР (листопад 1918 р. – липень 1919 р.)». Проаналізовано питання розбудови збройних сил, розподілу повноважень ключових органів державного керівництва та військового', 'Михайло Галущак', 'https://static.yakaboo.ua/media/cloudflare/product/webp/600x840/1/5/1547_1_1.jpg');
