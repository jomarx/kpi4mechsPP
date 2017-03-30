UPDATE kpi_mech.task_db SET BreakStartTime = (Curtime()) WHERE ID = %lu;


insert into kpi_mech.mbreak_db (SpecialSerial, BreakStartTime, TaskID) values (%d, (Curtime()), %d);



SELECT sm_db.AssetName, sm_db.SerialNo,sm_db.Make,sm_db.Model,sm_db.Supplier,sm_db.Category,sm_db.Location,sm_db.AssetStatus,sm_db.AssetCondition,mbreak_db.StartDate,mbreak_db.EndDate,mbcode_db.details,mbreak_db.TaskID as TaskID from sm_db INNER JOIN mbreak_db ON sm_db.SpecialSerial=mbreak_db.SpecialSerial INNER JOIN task_db ON task_db.ID=mbreak_db.TaskID INNER JOIN mbcode_db ON task_db.details=mbcode_db.id

SELECT ID, SpecialSerial FROM kpi_mech.task_db WHERE Status = 0 limit 1

SELECT sm_db.AssetName from sm_db INNER JOIN mbreak_db ON sm_db.SpecialSerial=mbreak_db.SpecialSerial INNER JOIN task_db ON task_db.ID=mbreak_db.TaskID INNER JOIN mbcode_db ON task_db.details=mbcode_db.id


insert into kpi_mech.mbreak_db (SpecialSerial, StartDate, TaskID) values (1, (now()),2);
insert into kpi_mech.mbreak_db (SpecialSerial, StartDate, TaskID) values (1, (now()),4);
insert into kpi_mech.mbreak_db (SpecialSerial, StartDate, TaskID) values (2, (now()),1);
insert into kpi_mech.mbreak_db (SpecialSerial, StartDate, TaskID) values (2, (now()),6);


UPDATE kpi_mech.mbreak_db SET EndDate = (now()) WHERE TaskID = %d;

insert into kpi_mech.task_db (EmpNo, Status, details, SpecialSerial, location, StartDate, BreakStartTime) values (%d, 0, %d, %d, 1, (now()),(Curtime()));



insert into kpi_mech.mstat_db (SpecialSerial, StartDate, Status) values (%d, (now()), 1);
insert into kpi_mech.mstat_db (SpecialSerial, StartDate, Status) values (2202009, (now()), 1);

UPDATE kpi_mech.mech_db SET att_stat = 1 WHERE SpecialSerial = %d;
UPDATE kpi_mech.mech_db SET att_stat = 1 WHERE SpecialSerial = 2202009;




SELECT SpecialSerial FROM kpi_mech.mech_db WHERE SpecialSerial = %lu;


UPDATE kpi_mech.mstat_db SET EndDate = (now()), status = 2 WHERE SpecialSerial = %d, status = 1;
UPDATE kpi_mech.mstat_db SET EndDate = (now()), status = 2 WHERE SpecialSerial = 2202009, status = 1;