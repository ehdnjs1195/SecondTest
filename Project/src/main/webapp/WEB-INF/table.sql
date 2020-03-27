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