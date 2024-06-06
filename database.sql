
 create table books(book_id serial primary key, subject text not null, description text not null, ISBN int null
, title text);
CREATE TABLE
 select *from books;
 book_id | subject | description | isbn | title
---------+---------+-------------+------+-------
(0 rows)

  create table users(user_id serial primary key, user_name text not null, other_information text null);
CREATE TABLE
 select *from users;
 user_id | user_name | other_information
---------+-----------+-------------------
(0 rows)


 create table chapters_text(name text not null, chapter_id serial primary key, text text, book_id serial,  fore
ign key(book_id) references books(book_id));
CREATE TABLE
 select *from chapters_text;
 name | chapter_id | text | book_id
------+------------+------+---------
(0 rows)


 create table chapters_image(name text, book_id serial, chapter_id serial, image bytea not null, foreign key(ch
apter_id) references chapters_text(chapter_id), foreign key(book_id) references books(book_id));
CREATE TABLE
select *from chapters_image;
 name | book_id | chapter_id | image
------+---------+------------+-------
(0 rows)


 create table chapters_figure(name text, book_id serial, chapter_id serial, figures bytea not null, foreign key
(book_id) references books(book_id), foreign key(chapter_id) references chapters_text(chapter_id));
CREATE TABLE
 select *from chapters_figure;
 name | book_id | chapter_id | figures
------+---------+------------+---------
(0 rows)


 create table notes_text(book_id serial, chapter_id serial, user_id serial, notes text, foreign key(book_id) re
ferences books(book_id), foreign key(chapter_id) references chapters(chapter_id), foreign key(user_id) references users(
user_id));

 create table notes_text(book_id serial, chapter_id serial, user_id serial, notes text, foreign key(book_id) references books(book_id), foreign key(chapter_id) references chapters_text(chapter_id), foreign key(user_id) references u
sers(user_id));

 select *from notes_text;
 book_id | chapter_id | user_id | notes
---------+------------+---------+-------
(0 rows)


 create table topics(chapter_id serial , topic_id serial primary key, revisions text null, topic_name text not
null, foreign key(chapter_id) references chapters_text(chapter_id));

 select *from topics;
 chapter_id | topic_id | revisions | topic_name
------------+----------+-----------+------------
(0 rows)


 create table tests(test_id serial primary key, chapter_id serial, test_questions text not null, user_status text not null, test_scores float not null, user_id serial, foreign key(chapter_id) references chapters_text(chapter_id), foreign key(user_id) references users(user_id));

select *from tests;
 test_id | chapter_id | test_questions | user_status | test_scores | user_id
---------+------------+----------------+-------------+-------------+---------
(0 rows)

 create table notes_image(book_id serial, chapter_id serial, user_id serial, image bytea not null, foreign key(
book_id) references books(book_id), foreign key(user_id) references users(user_id), foreign key(chapter_id) references c
hapters_text(chapter_id));


 select *from notes_image;
 book_id | chapter_id | user_id | image
---------+------------+---------+-------
(0 rows)

 create table notes_figure(book_id serial, chapter_id serial, user_id serial, figure bytea not null, foreign ke
y(book_id) references books(book_id), foreign key(user_id) references users(user_id), foreign key(chapter_id) references
 chapters_text(chapter_id));

 select *from notes_figure;
 book_id | chapter_id | user_id | figure
---------+------------+---------+--------
(0 rows)
