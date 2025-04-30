USE projdb;

-- 지역 테이블 (zcode)
CREATE TABLE 지역_zcode (
    지역코드 INT PRIMARY KEY,
    지역명 VARCHAR(50)
);

-- 지역 상세 테이블 (zscode)
CREATE TABLE 지역상세_zscode (
    지역코드 INT,
    지역구분상세코드 INT PRIMARY KEY,
    지역구명 VARCHAR(50),
    FOREIGN KEY (지역코드) REFERENCES 지역_zcode(지역코드)
);

-- 충전기타입 (Charger_Type) 테이블
CREATE TABLE 충전기타입_Charger_Type (
    충전기타입코드 CHAR(2) PRIMARY KEY,
    충전기타입 VARCHAR(50)
);

-- 충전기 상태 (Charger_stat) 테이블
CREATE TABLE 충전기_Charger_stat (
    충전기상태코드 CHAR(1) PRIMARY KEY,
    충전기상태 VARCHAR(50)
);


-- 지역별 충전기 테이블
CREATE TABLE 지역별_충전기 (
    id INT,
    충전소명 VARCHAR(50),
    주소 VARCHAR(50),
    위도 FLOAT,
    경도 FLOAT,
    충전기상태코드 CHAR(1),
    이용제한 VARCHAR(50),
    급속충전량 INT,
    충전기타입코드 CHAR(2),
    지역상세코드 INT,
    PRIMARY KEY (id, 충전소명),
    FOREIGN KEY (충전기상태코드) REFERENCES 충전기_Charger_stat(충전기상태코드),
    FOREIGN KEY (충전기타입코드) REFERENCES 충전기타입_Charger_Type(충전기타입코드),
    FOREIGN KEY (지역상세코드) REFERENCES 지역상세_zscode(지역구분상세코드)
);