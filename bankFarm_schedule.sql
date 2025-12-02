/*																				대출 연체 확인 스케줄러																		*/

-- 스케줄러가 켜져있는지 확인
SHOW VARIABLES LIKE 'event_scheduler';
-- 스케줄러가 꺼져있다면 켜주기
SET GLOBAL event_scheduler = ON;

CREATE EVENT IF NOT EXISTS ev_loan_overdue
ON SCHEDULE EVERY 1 DAY
STARTS '2025-12-03 00:00:00'
DO
CALL proc_loan_overdue();