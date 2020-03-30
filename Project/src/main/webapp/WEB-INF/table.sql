create table movie
(rank number not null,
movieId varchar2(5),
movieSeq varchar2(5) primary key,
title varchar2(200) not null,
titleEng varchar2(300),
genre varchar2(150),
director varchar2(100),
actor varchar2(500),
plot clob,
runtime varchar2(3),
repRlsDate varchar2(8),
keywords varchar2(200),
posters varchar2(150));

CREATE TABLE favorite(num NUMBER PRIMARY KEY,
id VARCHAR2(30), movieId VARCHAR2(5), 
movieSeq VARCHAR2(5),
repRlsDate VARCHAR2(8), genre VARCHAR2(150), title VARCHAR2(200) NOT NULL, poster VARCHAR2(150))

CREATE SEQUENCE Favorite_Seq;

alter table favorite add constraint favorite_Id_fk
foreign key(id) references users(id);