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


insert into movie values(
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
);
insert into movie values(
movie_seq.nextval,
'정직한 후보',
'어제까진 뻥쟁이, 오늘부턴 정직한 후보?!
거짓말이 제일 쉬운 3선 국회의원 ‘주상숙’에게 청천벽력이 떨어진다.
 하루아침에 거짓말은 1도 할 수 없는 ‘진실의 주둥이’를 갖게 된 것!',
'2020 .02.12 개봉',
'코미디',
'장유정',
'라미란',
'test2'
);
insert into movie values(
movie_seq.nextval,
'1917',
'두 명의 병사, 하나의 미션!
그들이 싸워야 할 것은 적이 아니라 시간이었다!
제1차 세계대전이 한창인 1917년.
 독일군에 의해 모든 통신망이 파괴된 상황 속에서',
'2020 .02.19 개봉',
'드라마, 전쟁',
'샘 멘데스',
'조지 맥케이, 단-찰스 채프먼',
'test3'
);
insert into movie values(
movie_seq.nextval,
'작은 아씨들',
'Dear women
그해 겨울, 사랑스러운 자매들을 만났다
배우가 되고 싶은 첫째 메그(엠마 왓슨)
 작가가 되고 싶은 둘째 조(시얼샤 로넌)
 음악가가 되고 싶은 셋째 베스(엘리자 스캔런)
 화가가 되고 싶은 막내 에이미(플로렌스 퓨)
 이웃집 소년 로리(티모시 샬라메)는 네 자매를 우연히 알게되고
 각기 다른 개성의 네 자매들과 인연을 쌓아간다.',
'2020 .02.12 개봉',
'드라마, 멜로/로멘스',
'그레타 거윅',
'시얼샤 로넌, 엠마 왓슨, 플로렌스 퓨',
'test4'
);