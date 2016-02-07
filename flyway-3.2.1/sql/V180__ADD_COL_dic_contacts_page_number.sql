ALTER TABLE icredit.dic_contacts_page_number
  ADD COLUMN parent_id INTEGER DEFAULT 0 NOT NULL;

COMMENT ON COLUMN icredit.dic_contacts_page_number.parent_id
IS 'Родительская страница, на которой расположена текущая. Для первого уровня родитель равен 0';