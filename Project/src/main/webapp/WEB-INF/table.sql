create table movie
(rank number not null,
movieId varchar2(5),
movieSeq varchar2(5) not null,
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


create table users
(id varchar2(50) primary key,
pwd varchar2(100) not null,
email varchar2(50),
regdate date,
profile varchar2(100),
master number(2) default 0 )

update users
set master = 1
where id = 'master00';

