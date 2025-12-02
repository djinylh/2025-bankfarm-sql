
/*																							대출 연체 프로시저 																	*/
DROP PROCEDURE IF EXISTS proc_loan_overdue;
DELIMITER $$

CREATE PROCEDURE proc_loan_overdue()
BEGIN
-- 공통 조인
CREATE TEMPORARY TABLE temp_rs AS 
    SELECT pr.prod_id, SUM(rr.rt_pct) AS total_rt_pct
    FROM prod_rate pr
    JOIN rate_rule rr ON rr.rt_id = pr.prod_rt_id AND rr.rt_tp = 'RT002'
    WHERE pr.prod_tp = 'RT007'
      AND pr.prod_id IN (
          SELECT loan_id 
          FROM loan_repayment 
          WHERE loan_due_sts = 'TX007'
      )
    GROUP BY pr.prod_id;

--									대출상환 아이디, 대출 아이디, 대출 스테이터스, 대출 상환금, 연체 시작일, 연체 이자, 연체 총 금액
INSERT INTO loan_overdue(loan_rpmt_id, loan_id, loan_od_due_sts, loan_od_amt, loan_od_st_dt, loan_od_intrst, loan_od_fn_amt)
SELECT
  lr.loan_rpmt_id, -- 대출 상환 아이디
  lr.loan_id, -- 대출 아이디
  'TX007',
    lr.loan_rpmt_due, -- 대출 금액
  lr.loan_due_dt, -- 대출 일시
  lr.loan_rpmt_intrst + COALESCE(rs.total_rt_pct, 0), -- 대출 총 이자 ( 원래 이자 + 가산 금리 )
  ROUND(lr.loan_rpmt_due * (lr.loan_rpmt_intrst + COALESCE(rs.total_rt_pct,0)),0)
FROM loan_repayment lr
LEFT JOIN temp_rs
    ON temp_rs.prod_id = lr.loan_id
WHERE lr.loan_due_sts = 'TX007'
AND lr.loan_due_dt = CURDATE() - INTERVAL 1 DAY;

-- 공통 연체에도 이동
INSERT INTO overdue_history(od_id, cust_id, od_source_id, od_tp, od_st_dt, od_amt)
SELECT UUID(), la.cust_id, lr.loan_rpmt_id, 'PD007', lr.loan_due_dt, ROUND(lr.loan_rpmt_due * (lr.loan_rpmt_intrst + COALESCE(rs.total_rt_pct,0)),0)
FROM loan_repayment lr
LEFT JOIN temp_rs
    ON temp_rs.prod_id = lr.loan_id
    LEFT JOIN loan_application la
    ON lr.loan_id = la.loan_id
WHERE lr.loan_due_sts = 'TX007'
AND lr.loan_due_dt = CURDATE() - INTERVAL 1 DAY;


END $$
DELIMITER ;



