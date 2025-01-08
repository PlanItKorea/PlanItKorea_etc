CREATE DATABASE plan_it_korea;
USE plan_it_korea;

# 유저 테이블 
CREATE TABLE Users (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    user_birth_date DATE NOT NULL,
    user_phone VARCHAR(15) NOT NULL,
    user_email VARCHAR(255) NOT NULL
);

# 숙소 상품 테이블 
CREATE TABLE Products (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price VARCHAR(255) NOT NULL,
    product_address VARCHAR(255) NOT NULL,
    product_description TEXT NOT NULL
);

# 예약 정보 테이블 
CREATE TABLE Reservations (
	user_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    person INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE
);

# 위시 리스트 정보 테이블 
CREATE TABLE Wish_List (
	user_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE
);

# 숙소 지역  
CREATE TABLE cities (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(255) NOT NULL
);

# 상품 지역
CREATE TABLE Product_Cities (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	product_id BIGINT NOT NULL,
    city_id BIGINT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE,
    FOREIGN KEY (city_id) REFERENCES cities(id)
);

# 숙소 유형
CREATE TABLE Accommodation_Categories (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    accommodation_name VARCHAR(255) NOT NULL
);

# 상품 숙소 유형
CREATE TABLE Product_Accommodation_Categories (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    accommodation_id BIGINT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id),
    FOREIGN KEY (accommodation_id) REFERENCES Accommodation_Categories(id)
);

# 편의 사항
CREATE TABLE Facilities (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    facility_name VARCHAR(255) NOT NULL
);

# 숙소 편의 사항
CREATE TABLE Product_Facilities (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    facility_id BIGINT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES Products(id),
    FOREIGN KEY (facility_id) REFERENCES Facilities(id)
);

# 메인 상품 이미지
CREATE TABLE Product_Images (
	product_id BIGINT NOT NULL,
    product_image VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE
);

# 서브 상품 객실
CREATE TABLE Sub_Products (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    main_product_id BIGINT NOT NULL,
    sub_name VARCHAR(255) NOT NULL,
    sub_description TEXT NOT NULL,
    sub_price VARCHAR(255) NOT NULL,
    sub_person INT NOT NULL,
    FOREIGN KEY (main_product_id) REFERENCES Products(id) ON DELETE CASCADE
);

# 객실 예약 날짜
CREATE TABLE Sub_Products_Date (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sub_product_id BIGINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (main_product_id) REFERENCES Sub_Products(id) ON DELETE CASCADE
);

# 서브 상품 이미지
CREATE TABLE Sub_Product_Images (
	product_id BIGINT NOT NULL,
    product_image VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Sub_Products(id) ON DELETE CASCADE
);

# 공지 사항
CREATE TABLE Boards (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    board_type ENUM("공지사항", "자주묻는질문"),
    board_title VARCHAR(255) NOT NULL,
    board_content TEXT NOT NULL,
    author VARCHAR(255) NOT NULL,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

# 1대1 질문 게시판
CREATE TABLE Inquiries (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    inquiry_title VARCHAR(255) NOT NULl,
    inquiry_categorys ENUM("결제", "취소", "환불"),
    inquiry_content TEXT NOT NULL,
    inquiry_image VARCHAR(255) 
);

# 리뷰 게시판
CREATE TABLE Reviews (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    review_commend TEXT NOT NULL,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);











