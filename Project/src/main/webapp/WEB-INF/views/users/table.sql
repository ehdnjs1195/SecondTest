create table movie
(movieSeq varchar2(10) primary key,
title varchar2(50) not null,
titleEng varchar2(50),
genre varchar2(50),
director varchar2(50),
actor varchar2(100),
plot clob,
runtime varchar2(10),
repRlsDate varchar2(20),
keywords varchar2(100),
posters varchar2(100));