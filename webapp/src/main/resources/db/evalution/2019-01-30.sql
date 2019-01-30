alter table ppt.tasks add finished_at timestamp;
update ppt.tasks set finished_at =finished_on;
alter table ppt.tasks add finished_ip varchar(200);
