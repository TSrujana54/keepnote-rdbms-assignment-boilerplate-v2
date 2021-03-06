create table Note(`note_id` int NOT NULL ,`note_title` VARCHAR(45) NOT NULL,`note_content` VARCHAR(500) NULL,`note_status` VARCHAR(10) NULL, `note_creation_date` DATE NULL,PRIMARY KEY (`note_id`));
CREATE TABLE `User` (`user_id` int NOT NULL,`user_name` VARCHAR(45) NOT NULL ,`user_added_date` DATE NULL, `user_password` VARCHAR(45) NULL, `user_mobile` VARCHAR(15) NULL, PRIMARY KEY (`user_id`));
CREATE TABLE `Reminder` (`reminder_id` int NOT NULL ,`reminder_name` VARCHAR(45) NOT NULL, `reminder_descr` VARCHAR(200) NULL,`reminder_type` VARCHAR(20) NULL, `reminder_creation_date` DATE NULL, `reminder_creator` int NULL, PRIMARY KEY (`reminder_id`),FOREIGN KEY (`reminder_creator`) REFERENCES User(`user_id`));
CREATE TABLE `Category` (`category_id` int NOT NULL ,`category_name` VARCHAR(45) NOT NULL,`category_descr` VARCHAR(45) NULL,`category_creation_date` DATE NULL,`category_creator` int NULL, PRIMARY KEY (`category_id`), FOREIGN KEY (`category_creator`) REFERENCES User(`user_id`));
CREATE TABLE `NoteCategory` (`notecategory_id` int NOT NULL , `note_id` int NOT NULL,`category_id` int NOT NULL, PRIMARY KEY (`notecategory_id`), FOREIGN KEY (`note_id`) REFERENCES Note(`note_id`), FOREIGN KEY (`category_id`) REFERENCES Category(`category_id`));
CREATE TABLE `Notereminder` (`notereminder_id` int NOT NULL ,`note_id` int NOT NULL, `reminder_id` int NOT NULL, PRIMARY KEY (`notereminder_id`), FOREIGN KEY (`note_id`) REFERENCES Note(`note_id`), FOREIGN KEY (`reminder_id`) REFERENCES Reminder(`reminder_id`));
CREATE TABLE `UserNote` (`usernote_id` int NOT NULL , `user_id` int NOT NULL,`note_id` int NOT NULL, PRIMARY KEY (`usernote_id`),FOREIGN KEY (`user_id`) REFERENCES User(`user_id`), FOREIGN KEY (`note_id`) REFERENCES Note(`note_id`));
INSERT INTO `User` (`user_id`,`user_name`,`user_added_date`,`user_password`,`user_mobile`) VALUES ('1','Sandeep','1991-12-12','passnan',8904128500);
INSERT INTO `User` (`user_id`,`user_name`,`user_added_date`,`user_password`,`user_mobile`) VALUES ('2','Reddy','1992-12-12','svns',8968569500);
INSERT INTO `User` (`user_id`,`user_name`,`user_added_date`,`user_password`,`user_mobile`) VALUES ('3','Dhoni','1991-11-10','svns',8956728500);
INSERT INTO `User` (`user_id`,`user_name`,`user_added_date`,`user_password`,`user_mobile`) VALUES ('4','Prabhas','1994-10-12','passnan',8904123400);
INSERT INTO `Note` (`note_id`, `note_title`, `note_content`, `note_status`, `note_creation_date`) VALUES ('11', 'Note1', 'Note1-content', 'Inprogress', '2007-02-03');
INSERT INTO `Note` (`note_id`, `note_title`, `note_content`, `note_status`, `note_creation_date`) VALUES ('22', 'Note2', 'Note2-content', 'InActive', '2007-02-05');
INSERT INTO `Note` (`note_id`, `note_title`, `note_content`, `note_status`, `note_creation_date`) VALUES ('33', 'Note3', 'Note3-content', 'Active', '2007-02-03');
INSERT INTO `Note` (`note_id`, `note_title`, `note_content`, `note_status`, `note_creation_date`) VALUES ('44', 'Note4', 'Note4-content', 'Success', '2007-12-13');
INSERT INTO `Reminder` ( `reminder_id`,`reminder_name`, `reminder_descr`, `reminder_type`, `reminder_creation_date`, `reminder_creator`) VALUES ( '1','rem1', 'rem1-desc', 'everyday', '2004-03-26', '1');
INSERT INTO `Reminder` ( `reminder_id`,`reminder_name`, `reminder_descr`, `reminder_type`, `reminder_creation_date`, `reminder_creator`) VALUES ( '2','rem2', 'rem2-desc', 'oneday', '2004-06-25', '2');
INSERT INTO `Reminder` ( `reminder_id`,`reminder_name`, `reminder_descr`, `reminder_type`, `reminder_creation_date`, `reminder_creator`) VALUES ( '3','rem3', 'rem3-desc', 'everyday', '2004-06-25', '3');
INSERT INTO `Reminder` ( `reminder_id`,`reminder_name`, `reminder_descr`, `reminder_type`, `reminder_creation_date`, `reminder_creator`) VALUES ( '4','rem4', 'rem4-desc', 'everyday', '2004-06-25', '4');
INSERT INTO `Category` ( `category_id`,`category_name`, `category_descr`, `category_creation_date`, `category_creator`) VALUES ( '1','Category1', 'Category1-desc', '2007-06-08', '1');
INSERT INTO `Category` ( `category_id`,`category_name`, `category_descr`, `category_creation_date`, `category_creator`) VALUES ( '2','Category2', 'Category2-desc', '2008-11-09', '2');
INSERT INTO `Category` ( `category_id`,`category_name`, `category_descr`, `category_creation_date`, `category_creator`) VALUES ( '3','Category3', 'Category3-desc', '2009-06-08', '3');
INSERT INTO `NoteCategory` ( `notecategory_id`,`note_id`, `category_id`) VALUES ( '1','11','1');
INSERT INTO `NoteCategory` ( `notecategory_id`,`note_id`, `category_id`) VALUES ( '2','22','2');
INSERT INTO `NoteCategory` ( `notecategory_id`,`note_id`, `category_id`) VALUES ( '3','33','3');
INSERT INTO `UserNote` ( `usernote_id`,`user_id`, `note_id`) VALUES ( '1','1', '11');
INSERT INTO `UserNote` ( `usernote_id`,`user_id`, `note_id`) VALUES ( '2','2', '22');
INSERT INTO `UserNote` ( `usernote_id`,`user_id`, `note_id`) VALUES ( '3','3', '33');
INSERT INTO `Notereminder` ( `notereminder_id`, `note_id`,`reminder_id`) VALUES ( '1','11', '1');
INSERT INTO `Notereminder` ( `notereminder_id`, `note_id`,`reminder_id`) VALUES ( '2','22', '2');
INSERT INTO `Notereminder` ( `notereminder_id`, `note_id`,`reminder_id`) VALUES ( '3','33', '3');
select * from User where user_id='1' and user_password='passrum';
select * from Note where note_creation_date = '2007-12-13';
select * from Category where category_creation_date >'2008-01-21';
select note_id from UserNote where user_id='2';
update Note set note_title="Note1",note_content="Note1-content-updated" ,note_status="completed" where note_id='1';
select * from User u INNER JOIN UserNote usernote on u.user_id and usernote.user_id where u.user_id='1';
SELECT * FROM Note INNER JOIN NoteCategory ON Note.note_id=NoteCategory.note_id where NoteCategory.category_id='3';
select * from Reminder r INNER JOIN Notereminder nr on r.reminder_id=nr.reminder_id where r.reminder_id='1';
select * from Reminder where reminder_id='3';
insert into Note(`note_id`,`note_title`,`note_content`,`note_status`,`note_creation_date`) values( '8','Note8', 'note8-content', 'Progress', '2019-06-15');
insert into NoteCategory(`notecategory_id`,`note_id`,`category_id`) values('5','22', '2');
insert into Reminder (`reminder_id`,`reminder_name`,`reminder_descr`,`reminder_type`,`reminder_creation_date`,`reminder_creator`) values('6','rem6', 'rem6-desc', '1hr', '2000-06-20', '1');
insert into Notereminder (`notereminder_id`,`note_id`,`reminder_id`) values('6','22','3');
insert into Note (`note_id`,`note_title`,`note_content`,`note_status`,`note_creation_date`) values('9','Note9', 'Note9-content', 'active', '2010-06-10');
insert into UserNote (`usernote_id`,`user_id`, `note_id`) values('7', '1','22');
delete from NoteCategory where note_id='44';
delete from UserNote where note_id='44' and user_id='4';
delete from Notereminder where note_id='44';
delete from Note where note_id='44';
delete from NoteCategory where category_id='3' AND note_id='33';
delete from Notereminder where note_id='33';
delete from UserNote where note_id='33';
delete from Note where note_id='33';
create trigger del_note before delete on Note FOR EACH ROW Begin delete from UserNote where note_id=old.note_id; delete from Notereminder where note_id=old.note_id; delete from NoteCategory where note_id=old.note_id; END;
create trigger del_user before delete on User FOR EACH ROW Begin delete from UserNote where note_id=old.user_id; delete from NoteReminder where note_id=old.user_id; delete from Category where category_creator=old.user_id; delete from NoteCategory where note_id=old.user_id; END;
