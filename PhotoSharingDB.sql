-- 1. Tạo Database
CREATE DATABASE PhotoSharingDB;
GO

USE PhotoSharingDB;
GO

-- 2. Bảng lưu thông tin Ảnh (Photos)
CREATE TABLE Photos (
    PhotoID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(150) NOT NULL,
    Description NVARCHAR(500),
    ImageFileName NVARCHAR(255) NOT NULL,
    UploadedDate DATETIME DEFAULT GETDATE(),
    Owner NVARCHAR(100)
);
GO

-- 3. Bảng lưu Bình luận (Comments)
CREATE TABLE Comments (
    CommentID INT IDENTITY(1,1) PRIMARY KEY,
    PhotoID INT NOT NULL,
    UserName NVARCHAR(100) NOT NULL,
    Subject NVARCHAR(200),
    Body NVARCHAR(MAX) NOT NULL,
    CONSTRAINT FK_Comments_Photos FOREIGN KEY (PhotoID) REFERENCES Photos(PhotoID) ON DELETE CASCADE
);
GO

-- 4. Thêm dữ liệu mẫu
INSERT INTO Photos (Title, Description, ImageFileName, Owner) 
VALUES 
(N'Hoàng hôn trên biển', N'Cảnh hoàng hôn tuyệt đẹp chụp tại Nha Trang.', N'sunset.jpg', N'Tính'),
(N'Phố cổ Hội An', N'Đèn lồng lung linh về đêm.', N'hoian.jpg', N'Admin');
GO

INSERT INTO Comments (PhotoID, UserName, Subject, Body) 
VALUES 
(1, N'Thanh Nga', N'Tuyệt quá!', N'Cảnh này đẹp quá bạn ơi.'),
(2, N'Hoàng Nam', N'Nhớ quê hương', N'Nhìn hoài niệm ghê.');
GO