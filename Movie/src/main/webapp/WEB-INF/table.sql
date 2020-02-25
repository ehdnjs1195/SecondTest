create table movie
(num number primary key,
title varchar2(100) not null,
content clob,
releasDate varchar2(100),
genre varchar2(50),
director varchar2(100),
actor varchar2(100),
fileName varchar2(100)
);

create sequence movie_seq;

insert into movie(
movie_seq.nextval,
'지푸라기라도 잡고 싶은 짐승들',
'사라진 애인 때문에 사채 빚에 시달리며 한 탕을 꿈꾸는 태영.
 아르바이트로 가족의 생계를 이어가는 가장 중만.
 과거를 지우고 새 인생을 살기 위해 남의 것을 탐하는 연희.',
'2020.02.19 개봉',
'범죄, 스릴러',
'김용훈',
'전도연, 정우성, 배성우',
'test1'
)