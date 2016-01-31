--syst m_param t rs

INSERT INTO icredit.system_parameters ("id", "par_name", "value", "comment", "type_par", "active", "dic_name", "group_name")
VALUES  (4,  'count_attempts_enter_password',  '3', 'comment',  'integer', 1, NULL, 2);
INSERT INTO icredit.system_parameters ("id", "par_name", "value", "comment", "type_par", "active", "dic_name", "group_name")
VALUES  (3, 'time_locked_account_wrong_password', '5', 'comment', 'integer', 1, NULL, 2);

  --------------------------------------------