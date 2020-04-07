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

CREATE TABLE movie_rank(
	rank number,
	title VARCHAR2(200),
	starPoint number(3,2),
	link VARCHAR2(300)
);

-- 댓글 정보를 저장할 테이블
CREATE TABLE movie_comment(
	num NUMBER PRIMARY KEY, -- 댓글의 글번호
	writer VARCHAR2(100), -- 댓글 작성자
	content VARCHAR2(500), -- 댓글 내용
	target_id VARCHAR2(100), -- 댓글의대상이되는아이디(글작성자)
	ref_group NUMBER, -- 댓글 그룹번호
	comment_group NUMBER, -- 원글에 달린 댓글 내에서의 그룹번호
	deleted CHAR(3) DEFAULT 'no', -- 댓글이 삭제 되었는지 여부 
	regdate DATE -- 댓글 등록일 
);

CREATE SEQUENCE movie_comment_seq;

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

ALTER TABLE movie_comment 
ADD(recommendCnt number default 0);

create table recommend 
(id varchar2(100) primary key,
num number)


CREATE TABLE favorite(num NUMBER PRIMARY KEY,
id VARCHAR2(30), movieId VARCHAR2(5), 
movieSeq VARCHAR2(5),
repRlsDate VARCHAR2(150), genre VARCHAR2(150), title VARCHAR2(400) NOT NULL, posters VARCHAR2(150), isDeleted VARCHAR2(10));

CREATE SEQUENCE Favorite_Seq;