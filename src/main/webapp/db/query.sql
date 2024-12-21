CREATE TABLE user (
    id VARCHAR(20) PRIMARY KEY,          
    passwd VARCHAR(20) NOT NULL,           
    role ENUM('admin', 'user') NOT NULL DEFAULT 'user'  
); -- 제약 설정 완료

CREATE TABLE post(
	id INT AUTO_INCREMENT UNIQUE;
	title VARCHAR(30),
	content VARCHAR(200), 
	user_id VARCHAR(20),
	name VARCHAR(10), 
	date DATE,		
	rating integer
); 
CREATE INDEX IDX_POST_date_DESC ON POST (date DESC);

CREATE TABLE feature (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)-- 특징(ex 붐비지 않아요)
);
CREATE INDEX idx_feature_id ON feature (id);
--DROP INDEX idx_feature_id ON feature

CREATE TABLE place (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50), -- 장소이름( ex 전주 한옥마을)
    latent1 DOUBLE,
    latent2 DOUBLE,
    latent3 DOUBLE,
    coordinate VARCHAR(50)
);

CREATE TABLE place_feature (
    place_id INT,
    feature_id INT,
    value DOUBLE, -- 특징비율
);
CREATE INDEX idx_place_feature_placeid_value ON place_feature (place_id, value);
--DROP INDEX idx_place_feature_placeid_value ON place_feature;

select * from user;
select * from post;
SELECT * FROM FEATURE;
select * from place;
select * from place_feature;



-- place
INSERT INTO place (name, latent1, latent2, latent3, coordinate) VALUES 
('전주 풍패지관', 0.23, 0.1, 0.16, '35.81844233303248, 127.14536254132553'),
('풍남문', 0.24, 0.11, 0, '35.81349317968503, 127.14759270250747'),
('전주경기전', 0.27, 0, 0.09, '35.81534610817482, 127.14979470079824'),
('전주 한옥마을', 0.23, 0, 0, '35.81753576414229, 127.15204264784524'),
('오목대', 0.27, 0.05, 0, '35.8143839407545, 127.1546004283056'),
('자만벽화마을', 0.2, 0, 0.25, '35.814212246490925, 127.15721165780226'),
('한벽당', 0.27, 0, 0.11, '35.81187689743302, 127.16086283153231'),
('전주향교', 0.28, 0.05, 0, '35.81261404690533, 127.15722814451907'),
('전주덕진공원', 0.25, 0.2, 0, '35.84756816701689, 127.12189479993413'),
('덕진체련공원', 0.23, 0, 0.11, '35.853101410071645, 127.14002694872647'),
('중상보도시근린공원', 0.22, 0.14, 0, '35.83049407660942, 127.17113707139737'),
('전북투어패스', 0.19, 0.2, 0.23, '35.820350620801136, 127.1087837317092'),
('전주곤충캠퍼스', 0.12, 0.28, 0, '35.81440592927607, 127.1455103048161'),
('루이엘모자박물관', 0.15, 0.13, 0, '35.81850338008661, 127.14842075581363'),
('전주전통술박물관', 0.1, 0.23, 0, '35.81692379172037, 127.1535123678698'),
('전주난장', 0.1, 0.25, 0, '35.818514545456615, 127.152567942601'),
('세병공원', 0.2, 0.12, 0.06, '35.87666239907047, 127.1307286828964'),
('전주동물원', 0.1, 0.1, 0.32, '35.855127262869566, 127.14434436201438'),
('전북대학교 박물관', 0.1, 0.35, 0.08, '35.84590897035302, 127.12753036582332'),
('가련산공원', 0.3, 0.1, 0.09, '35.84445937563751, 127.1191757405669'),
('전주드림랜드', 0.2, 0.1, 0.33, '35.85763267843176, 127.14404222563029'),
('전주 일몽', 0.1, 0.1, 0.1, '35.81843944441437, 127.14536172631179');


-- FEATURE
INSERT INTO feature (name) VALUES ('붐비지 않아요');
INSERT INTO feature (name) VALUES ('사진이 잘 나와요');
INSERT INTO feature (name) VALUES ('볼거리가 많아요');
INSERT INTO feature (name) VALUES ('주차하기 편해요');
INSERT INTO feature (name) VALUES ('가격이 합리적이에요');
INSERT INTO feature (name) VALUES ('설명이 잘 되어있어요');
INSERT INTO feature (name) VALUES ('관리가 잘 되어있어요');
INSERT INTO feature (name) VALUES ('아이와 가기 좋아요');
INSERT INTO feature (name) VALUES ('근처에 갈 곳이 많아요');
INSERT INTO feature (name) VALUES ('야경이 멋져요');
INSERT INTO feature (name) VALUES ('체험 프로그램이 다양해요');
INSERT INTO feature (name) VALUES ('경관이 독특해요');
INSERT INTO feature (name) VALUES ('유익해요');
INSERT INTO feature (name) VALUES ('전시 구성이 알차요');
INSERT INTO feature (name) VALUES ('전시 테마가 재밌어요');
INSERT INTO feature (name) VALUES ('공간이 넓어요');
INSERT INTO feature (name) VALUES ('뷰가 좋아요');
INSERT INTO feature (name) VALUES ('산책로가 잘 되어있어요');
INSERT INTO feature (name) VALUES ('대중교통이 편해요');
INSERT INTO feature (name) VALUES ('방문객이 많아요');
INSERT INTO feature (name) VALUES ('규모가 커요');
INSERT INTO feature (name) VALUES ('화장실이 깨끗해요');
INSERT INTO feature (name) VALUES ('편의시설이 잘 되어있어요');
INSERT INTO feature (name) VALUES ('반려동물과 가기 좋아요');
INSERT INTO feature (name) VALUES ('컨셉이 독특해요');
INSERT INTO feature (name) VALUES ('먹거리가 풍부해요');
INSERT INTO feature (name) VALUES ('자연 경관이 좋아요');
INSERT INTO feature (name) VALUES ('친절해요');
INSERT INTO feature (name) VALUES ('초보자에게도 적합해요');
INSERT INTO feature (name) VALUES ('시설이 깔끔해요');
INSERT INTO feature (name) VALUES ('원데이 클래스가 알차요');
INSERT INTO feature (name) VALUES ('수업 시간이 충분해요');
INSERT INTO feature (name) VALUES ('설명이 자세해요');
INSERT INTO feature (name) VALUES ('선물하기 좋아요');
INSERT INTO feature (name) VALUES ('프라이빗해요');
INSERT INTO feature (name) VALUES ('디자인이 멋져요');
INSERT INTO feature (name) VALUES ('맞춤 수업을 잘해줘요');
INSERT INTO feature (name) VALUES ('품질이 좋아요');
INSERT INTO feature (name) VALUES ('단체로 가기 좋아요');
INSERT INTO feature (name) VALUES ('피크닉하기 좋아요');
INSERT INTO feature (name) VALUES ('조용히 쉬기 좋아요');
INSERT INTO feature (name) VALUES ('동물 관리가 잘 되어있어요');
INSERT INTO feature (name) VALUES ('놀이기구가 다양해요');
INSERT INTO feature (name) VALUES ('대기시간이 짧아요');
INSERT INTO feature (name) VALUES ('안전하게 관리해요');
INSERT INTO feature (name) VALUES ('셔틀버스가 잘 되어있어요');
INSERT INTO feature (name) VALUES ('트렌디해요');
-- 더미데이터
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전북대학교 박물관', '2024-05-07', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '세병공원', '2024-02-15', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '중상보도시근린공원', '2024-11-19', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '중상보도시근린공원', '2024-11-11', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주동물원', '2024-12-07', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '중상보도시근린공원', '2024-10-06', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '세병공원', '2024-08-09', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '전주 일몽', '2024-04-27', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '덕진체련공원', '2024-11-13', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주동물원', '2024-03-31', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '덕진체련공원', '2024-02-19', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '덕진체련공원', '2024-03-02', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '전주 풍패지관', '2024-01-22', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '한벽당', '2024-05-14', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전주 일몽', '2024-05-04', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '풍남문', '2024-02-14', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전북대학교 박물관', '2024-07-19', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '전주경기전', '2024-01-08', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '가련산공원', '2024-11-03', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '풍남문', '2024-07-24', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주경기전', '2024-05-23', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '전주향교', '2024-11-24', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '전북투어패스', '2024-03-05', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주난장', '2024-04-09', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전주곤충캠퍼스', '2024-07-05', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전북대학교 박물관', '2024-11-06', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전주덕진공원', '2024-04-01', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주곤충캠퍼스', '2024-08-12', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주난장', '2024-01-22', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '세병공원', '2024-08-18', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '전주향교', '2024-11-27', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '풍남문', '2024-01-13', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '오목대', '2024-04-12', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '전주덕진공원', '2024-08-24', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주 일몽', '2024-03-26', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '덕진체련공원', '2024-05-14', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주덕진공원', '2024-02-01', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '가련산공원', '2024-05-13', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전주곤충캠퍼스', '2024-03-09', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '루이엘모자박물관', '2024-10-01', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '한벽당', '2024-01-29', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '한벽당', '2024-10-29', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전주 풍패지관', '2024-03-04', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '오목대', '2024-07-16', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전주 풍패지관', '2024-12-27', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '자만벽화마을', '2024-10-23', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '루이엘모자박물관', '2024-03-27', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전북투어패스', '2024-12-17', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '덕진체련공원', '2024-03-11', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주덕진공원', '2024-07-03', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '풍남문', '2024-02-27', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전주곤충캠퍼스', '2024-12-13', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전주경기전', '2024-01-15', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '중상보도시근린공원', '2024-11-15', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전북대학교 박물관', '2024-10-29', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '덕진체련공원', '2024-04-27', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전주드림랜드', '2024-07-22', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전주전통술박물관', '2024-03-20', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전주곤충캠퍼스', '2024-05-20', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전주난장', '2024-10-03', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전북대학교 박물관', '2024-12-28', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주난장', '2024-11-01', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '전북대학교 박물관', '2024-01-08', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '풍남문', '2024-12-24', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '오목대', '2024-11-15', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '풍남문', '2024-07-14', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '전주 일몽', '2024-01-13', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '자만벽화마을', '2024-10-10', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '오목대', '2024-03-20', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주 풍패지관', '2024-11-07', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '전주향교', '2024-10-21', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전주동물원', '2024-09-21', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '전주향교', '2024-01-30', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '루이엘모자박물관', '2024-11-20', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전주 풍패지관', '2024-07-15', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '덕진체련공원', '2024-02-02', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '한벽당', '2024-05-18', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '전주곤충캠퍼스', '2024-12-23', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '오목대', '2024-03-10', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주전통술박물관', '2024-04-29', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '오목대', '2024-09-01', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전주 일몽', '2024-05-15', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '루이엘모자박물관', '2024-01-21', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '전주 풍패지관', '2024-05-25', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전주향교', '2024-06-01', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '전주 한옥마을', '2024-08-13', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전북투어패스', '2024-06-26', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '전주향교', '2024-04-04', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '전주전통술박물관', '2024-05-19', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전주덕진공원', '2024-03-27', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '전주 일몽', '2024-06-14', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '한벽당', '2024-02-24', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주전통술박물관', '2024-03-17', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '자만벽화마을', '2024-01-08', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주 일몽', '2024-11-26', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '세병공원', '2024-03-11', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '전주곤충캠퍼스', '2024-02-05', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '가련산공원', '2024-06-06', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '전주향교', '2024-01-14', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전북대학교 박물관', '2024-02-03', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전주향교', '2024-04-21', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '전주덕진공원', '2024-09-01', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '세병공원', '2024-07-21', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전주난장', '2024-08-03', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전북투어패스', '2024-12-28', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '가련산공원', '2024-11-10', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '중상보도시근린공원', '2024-05-20', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '오목대', '2024-04-01', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '한벽당', '2024-02-21', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test4', '전주동물원', '2024-05-23', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전주곤충캠퍼스', '2024-08-14', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '세병공원', '2024-07-18', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test3', '전주 풍패지관', '2024-05-28', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주경기전', '2024-09-09', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '풍남문', '2024-07-28', 5);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test1', '전주경기전', '2024-10-14', 2);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '전북투어패스', '2024-09-22', 1);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '루이엘모자박물관', '2024-02-15', 4);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test5', '전주난장', '2024-12-01', 3);
INSERT INTO post (title, content, user_id, name, date, rating) VALUES ('dummy_title', 'dummy_content', 'test2', '오목대', '2024-09-17', 5);

-- place_feature
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 1, 0.209302);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 2, 0.162791);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 3, 0.116279);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 4, 0.093023);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 5, 0.093023);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 6, 0.069767);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 7, 0.069767);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 8, 0.069767);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 9, 0.046512);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 10, 0.023256);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 11, 0.023256);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (1, 12, 0.023256);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 1, 0.064516);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 2, 0.290323);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 3, 0.112903);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 4, 0.048387);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 6, 0.016129);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 7, 0.048387);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 8, 0.048387);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 9, 0.112903);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 10, 0.129032);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 11, 0.016129);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 12, 0.016129);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 17, 0.048387);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 18, 0.032258);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (2, 19, 0.016129);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 1, 0.097198);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 2, 0.259577);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 3, 0.119497);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 4, 0.006289);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 5, 0.071469);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 6, 0.026872);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 7, 0.089766);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 8, 0.054889);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 9, 0.029160);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 10, 0.001144);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 11, 0.019440);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 12, 0.004002);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 17, 0.058319);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 18, 0.110349);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 19, 0.002287);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 20, 0.032018);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 21, 0.012007);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 22, 0.003431);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 23, 0.001715);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (3, 24, 0.000572);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 1, 0.010072);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 2, 0.132374);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 3, 0.179856);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 4, 0.020144);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 5, 0.007194);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 7, 0.079137);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 8, 0.023022);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 9, 0.018705);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 11, 0.017266);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 13, 0.001439);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 17, 0.159712);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 18, 0.084892);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 19, 0.002878);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 20, 0.102158);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 21, 0.008633);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 22, 0.005755);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 23, 0.030216);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 24, 0.002878);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 25, 0.002878);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 26, 0.106475);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 27, 0.002878);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (4, 28, 0.001439);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (5, 1, 0.200000);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (5, 2, 0.186667);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (5, 3, 0.053333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (5, 7, 0.080000);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (5, 8, 0.026667);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (5, 10, 0.080000);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (5, 11, 0.013333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (5, 17, 0.160000);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (5, 18, 0.186667);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (5, 24, 0.013333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 1, 0.173913);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 2, 0.043478);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 3, 0.260870);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 5, 0.043478);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 7, 0.021739);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 8, 0.086957);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 11, 0.043478);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 13, 0.021739);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 17, 0.065217);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 22, 0.021739);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 27, 0.173913);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (6, 28, 0.043478);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (7, 1, 0.133333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (7, 2, 0.266667);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (7, 3, 0.100000);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (7, 4, 0.033333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (7, 5, 0.166667);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (7, 7, 0.100000);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (7, 8, 0.033333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (7, 10, 0.033333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (7, 11, 0.066667);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (7, 17, 0.033333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (7, 22, 0.033333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (8, 1, 0.176471);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (8, 2, 0.294118);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (8, 3, 0.058824);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (8, 6, 0.029412);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (8, 7, 0.117647);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (8, 8, 0.029412);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (8, 9, 0.029412);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (8, 11, 0.029412);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (8, 12, 0.058824);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (8, 17, 0.117647);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (8, 18, 0.058824);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 1, 0.040984);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 2, 0.147541);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 3, 0.053279);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 4, 0.049180);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 7, 0.110656);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 8, 0.012295);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 9, 0.008197);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 17, 0.225410);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 18, 0.225410);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 19, 0.004098);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 20, 0.028689);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 21, 0.004098);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 23, 0.016393);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 24, 0.004098);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 27, 0.053279);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (9, 41, 0.016393);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (10, 1, 0.016393);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (10, 2, 0.049180);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (10, 3, 0.049180);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (10, 4, 0.163934);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (10, 5, 0.049180);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (10, 7, 0.131148);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (10, 11, 0.016393);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (10, 17, 0.245902);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (10, 18, 0.147541);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (10, 20, 0.032787);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (10, 23, 0.098361);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (11, 1, 0.120000);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (11, 2, 0.066667);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (11, 3, 0.106667);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (11, 4, 0.133333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (11, 5, 0.013333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (11, 7, 0.146667);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (11, 17, 0.106667);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (11, 18, 0.133333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (11, 20, 0.026667);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (11, 23, 0.093333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (11, 26, 0.053333);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 1, 0.012747);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 2, 0.066922);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 3, 0.158062);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 4, 0.019758);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 5, 0.187380);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 7, 0.068196);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 8, 0.094328);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 9, 0.079669);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 11, 0.116635);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 13, 0.005736);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 17, 0.016571);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 18, 0.011472);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 20, 0.007648);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 21, 0.001275);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 22, 0.000637);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 23, 0.040790);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 26, 0.036329);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 27, 0.001912);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 28, 0.072658);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 41, 0.000637);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (12, 47, 0.000637);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (13, 2, 0.039370);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (13, 4, 0.031496);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (13, 5, 0.047244);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (13, 6, 0.165354);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (13, 8, 0.125984);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (13, 11, 0.102362);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (13, 13, 0.322835);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (13, 14, 0.102362);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (13, 15, 0.039370);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (13, 16, 0.023622);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (14, 2, 0.156863);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (14, 4, 0.019608);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (14, 5, 0.098039);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (14, 6, 0.117647);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (14, 8, 0.058824);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (14, 13, 0.196078);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (14, 14, 0.137255);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (14, 15, 0.176471);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (14, 16, 0.019608);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (14, 25, 0.019608);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 2, 0.031477);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 4, 0.033898);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 5, 0.125908);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 6, 0.171913);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 8, 0.016949);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 11, 0.111380);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 13, 0.232446);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 14, 0.121065);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 15, 0.121065);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 16, 0.029056);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 22, 0.002421);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (15, 25, 0.002421);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 2, 0.097145);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 4, 0.006467);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 5, 0.093366);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 6, 0.022016);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 8, 0.077963);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 11, 0.106009);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 13, 0.097217);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 14, 0.196614);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 15, 0.211218);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 16, 0.069462);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 17, 0.000654);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 22, 0.001381);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 24, 0.000581);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (16, 25, 0.019908);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 2, 0.064516);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 3, 0.096774);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 4, 0.032258);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 5, 0.032258);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 7, 0.032258);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 8, 0.096774);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 17, 0.129032);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 18, 0.193548);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 19, 0.032258);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 24, 0.096774);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 40, 0.161290);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (17, 41, 0.032258);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 2, 0.001813);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 3, 0.179904);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 4, 0.140227);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 5, 0.169723);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 8, 0.011505);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 11, 0.013388);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 13, 0.000906);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 17, 0.000837);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 18, 0.009414);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 19, 0.000349);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 21, 0.145945);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 22, 0.001395);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 23, 0.040234);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 24, 0.000279);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 25, 0.000070);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 26, 0.008437);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 28, 0.000209);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 30, 0.110522);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 40, 0.005509);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 42, 0.132557);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 43, 0.025661);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (18, 44, 0.001116);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (19, 2, 0.021978);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (19, 4, 0.313187);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (19, 5, 0.043956);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (19, 6, 0.098901);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (19, 8, 0.005495);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (19, 11, 0.043956);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (19, 13, 0.263736);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (19, 14, 0.071429);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (19, 15, 0.038462);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (19, 16, 0.093407);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (19, 25, 0.005495);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (20, 2, 0.107143);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (20, 3, 0.107143);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (20, 4, 0.035714);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (20, 5, 0.214286);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (20, 7, 0.071429);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (20, 17, 0.285714);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (20, 18, 0.142857);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (20, 23, 0.035714);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 2, 0.056993);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 3, 0.209492);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 4, 0.112235);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 5, 0.185372);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 8, 0.185762);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 11, 0.028205);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 13, 0.000973);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 21, 0.001945);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 25, 0.000195);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 26, 0.033067);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 28, 0.001362);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 30, 0.001945);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 42, 0.003696);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 43, 0.175841);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 44, 0.001945);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 45, 0.000778);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (21, 46, 0.000195);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 4, 0.000428);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 5, 0.014009);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 28, 0.138496);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 29, 0.183642);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 30, 0.153239);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 31, 0.090047);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 32, 0.087600);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 33, 0.076344);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 34, 0.070961);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 35, 0.057809);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 36, 0.049183);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 37, 0.037499);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 38, 0.030403);
INSERT INTO place_feature (place_id, feature_id, value) VALUES (22, 39, 0.010338);