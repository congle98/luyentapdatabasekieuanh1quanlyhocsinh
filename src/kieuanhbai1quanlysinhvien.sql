create database luyentapkieuanh1quanlyhocvien;
use luyentapkieuanh1quanlyhocvien;
create table class(
                      id int primary key AUTO_INCREMENT,
                      name varchar(20),
                      language varchar(20),
                      description varchar(50)
);
create table address(
                        id int primary key AUTO_INCREMENT,
                        address varchar(50)
);
create table course(
                       id int primary key AUTO_INCREMENT,
                       name varchar(20),
                       description varchar(50)
);
create table students(
                         id int primary key AUTO_INCREMENT,
                         fullname varchar(20),
                         address_id int,
                         phone varchar(20) unique,
                         class_id int,
                         FOREIGN KEY (address_id) REFERENCES address(id),
                         FOREIGN KEY (class_id) REFERENCES class(id)
);
create table point(
                      id int primary key AUTO_INCREMENT,
                      course_id int,
                      student_id int,
                      point double,
                      FOREIGN KEY (course_id) REFERENCES course(id),
                      FOREIGN KEY (student_id) REFERENCES students(id)
);
insert into address(address) values ('Hà Nội');
insert into address(address) values ('Thái Bình');
insert into address(address) values ('Phú Thọ');
insert into address(address) values ('Ba Vì');
insert into address(address) values ('Lào Cai');

insert into class(name,language,description) values ('java01','java','Đây là lớp java01');
insert into class(name,language,description) values ('python01','python','Đây là lớp python01');
insert into class(name,language,description) values ('java script01','java script','Đây là lớp java script01');
insert into class(name,language,description) values ('css01','css','Đây là lớp css01');
insert into class(name,language,description) values ('html01','html','Đây là lớp html01');

insert into course(name,description) values ('lập trình java','khoá dạy lập trình java cơ bản');
insert into course(name,description) values ('lập trình python','khoá dạy lập trình python cơ bản');
insert into course(name,description) values ('lập trình java scrip','khoá dạy lập trình java script cơ bản');
insert into course(name,description) values ('lập trình css','khoá dạy lập trình css cơ bản');
insert into course(name,description) values ('lập trình html','khoá dạy lập trình html cơ bản');

insert into students( fullname,address_id,phone,class_id) values ('Lê Thành Công',1,'0342910909',1);
insert into students( fullname,address_id,phone,class_id) values ('Nguyễn Thuý Quỳnh',2,'0342910403',1);
insert into students( fullname,address_id,phone,class_id) values ('Trần Mai Hương',3,'0342910201',1);
insert into students( fullname,address_id,phone,class_id) values ('Tạ Thị Thuý',1,'0342910207',2);
insert into students( fullname,address_id,phone,class_id) values ('Hoàng Minh Trang',5,'0342910006',2);
insert into students( fullname,address_id,phone,class_id) values ('Nguyễn Kiều My',4,'0342910204',3);
insert into students( fullname,address_id,phone,class_id) values ('Đào Mai Trang',5,'0342910255',4);
insert into students( fullname,address_id,phone,class_id) values ('Bùi Khánh Ly',1,'0342910200',5);
insert into students( fullname,address_id,phone,class_id) values ('Trần Thu Hà',2,'03429104100',4);
insert into students( fullname,address_id,phone,class_id) values ('Nguyễn Thu Thuỷ',4,'034295265',3);

insert into point(course_id, student_id,point) values (5,1,8);
insert into point(course_id, student_id,point) values (3,1,9);
insert into point(course_id, student_id,point) values (5,3,4);
insert into point(course_id, student_id,point) values (1,4,2);
insert into point(course_id, student_id,point) values (2,5,8);
insert into point(course_id, student_id,point) values (5,6,7);
insert into point(course_id, student_id,point) values (4,7,5);
insert into point(course_id, student_id,point) values (4,8,6);
insert into point(course_id, student_id,point) values (5,11,8);
insert into point(course_id, student_id,point) values (2,10,9);
insert into point(course_id, student_id,point) values (3,10,7);
insert into point(course_id, student_id,point) values (2,12,5);
insert into point(course_id, student_id,point) values (3,12,8);
insert into point(course_id, student_id,point) values (5,4,5);


-- lấy ra tổng số học sinh của từng lớp--
select class.name, count(students.id) as count
from class
    inner join students on class.id = students.class_id
GROUP BY class.name
order by class.name;

-- đếm số lượng học sinh của các tỉnh
select address.address, count(students.id) as count
from address
    inner join students on address.id = students.address_id
GROUP BY address.address
order by address.address;

-- điểm trung bình các khoá học
select course.name, avg(point.point)
from course
         inner join point on course.id = point.course_id
GROUP BY course.name
order by course.name;

-- khoá học có điểm trung bình cao nhất
select course.name, avg(point.point) as avg
from course
         inner join point on course.id = point.course_id
GROUP BY course.name
order by avg DESC
    limit 1;