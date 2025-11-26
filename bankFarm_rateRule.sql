INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','신용등급 1~3등급',0.3,'우수 신용등급 고객');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','신용등급 4~6등급',0.8,'중간 신용등급 고객');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','신용등급 7~10등급',1.5,'저 신용등급 고객');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','대출기간 0~12개월',0.1,'단기 대출');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','대출기간 13~16개월',0.3,'중기 대출');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','대출기간 37개월 이상',0.3,'장기 대출');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','CREDIT',0.5,'신용 대출');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','BUSINESS',0.7,'사업자 대출');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','RENT',0.2,'전세자금 대출');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','청년',0.5,'만 19~34세 고객 대상 우대금리');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','다자녀',0.7,'자녀 3명 이상 보유 고객 대상 우대금리');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','급여 이체',0.7,'본인 명의 급여 계좌 자동이체 고객 대상 우대금리');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT002','자동 이체',0.7,'정기적인 공과금/보험료 자동이체 고객 대상 우대금리');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT001','자동이체 3건이상',0.1,'3건 이상 자동이체 등록 고객 우대');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT001','카드사용실적',0.1,'체크/신용카드 월 30만원 이상 사용 고객');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT001','급여/연금 수령',0.2,'급여-연금을 해당 은행 꼐좌로 수령하는 고객');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT001','공과금 자동납무',0.1,'전기/가스/통신요금 자동납부 등록 고객');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT001','신혼부부',0.2,'혼인 7년 이내 신혼부부 고객');

INSERT INTO rate_rule (rt_tp,rt_rule,rt_pct,rt_des)
VALUE ('RT001','군인',0.1,'군 복무 중인 고객 우대');