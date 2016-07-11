

INSERT INTO icredit.contacts ("created", "created_by", "last_updated", "last_updated_by", "last_name", "first_name", "midle_name", "residency", "income_monthly", "income_family", "employment_type", "work_place", "work_position", "sex", "education", "date_birsday", "family_count", "id_tax", "married", "citizenship", "localisation")
VALUES
  ('2016-01-31 19:29:01', 1, '2016-01-31 19:29:01', 1, 'Андронов', 'Игорь', 'Олегович', 'R', 1000, 10000, 1, 'Luxoft', 'Programer', 1, 1, '1974-01-18', 3, '1234567890', True, '980', 'RUS');

INSERT INTO icredit.contacts_www ("created", "created_by", "last_updated", "last_updated_by", "id_contact", "name", "name_type", "active", "use_for_correspondence")
VALUES
  ('2016-01-31 19:36:53', 1, '2016-01-31 19:36:53', 1, 2, 'цццц', 1, 1, True);


INSERT INTO icredit.contacts_pwd ("created", "created_by", "last_updated", "last_updated_by", "id_contact", "login_name", "pwd")
VALUES
  ('2016-01-31 19:32:57', 1, '2016-01-31 19:32:57', 1, 2, 'igor.emailplace@gmail.com', '123');
  /* Data for the 'icredit.contacts_phones' table  (Records 1 - 1) */

INSERT INTO icredit.contacts_phones ("created", "created_by", "last_updated", "last_updated_by", "id_contact", "phone_number", "phone_type", "active", "use_for_sms")
VALUES
  ('2016-01-31 19:36:09', 1, '2016-01-31 19:36:09', 1, 2, '0663456728', 1, 1, True);

  /* Data for the 'icredit.contacts_documents' table  (Records 1 - 1) */

INSERT INTO icredit.contacts_documents ("created", "created_by", "last_updated", "last_updated_by", "id_contact", "doc_seria", "doc_number", "date_doc_given", "doc_given", "doc_type", "active")
VALUES
  ('2016-01-31 19:35:22', 1, '2016-01-31 19:35:22', 1, 2, 'СО', 123456, '2016-01-20', 'Милицией', 1, 1);

  /* Data for the 'icredit.contacts_adress' table  (Records 1 - 1) */

INSERT INTO icredit.contacts_adress ("created", "created_by", "last_updated", "last_updated_by", "id_contact", "area", "district", "city", "post_index", "street_type", "street", "house", "corp", "flat", "address_type", "active", "city_type")
VALUES
  ('2016-01-31 19:33:38', 1, '2016-01-31 19:33:38', 1, 2, 1, 1, 'Kiev', 3212, 1, 'шевченка', '1', NULL, '22', 1, 1, 1);