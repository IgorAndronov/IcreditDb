CREATE TABLE icredit.relation_group_n_to_page_n (
  id INTEGER DEFAULT nextval('icredit.seq_relation_group_n_to_page_n'::regclass) NOT NULL,
  contact_page_number INTEGER NOT NULL,
  contact_block_number INTEGER NOT NULL UNIQUE,
  sorting INTEGER DEFAULT 1 NOT NULL,
  PRIMARY KEY(id)
)
WITH (oids = false);

COMMENT ON TABLE icredit.relation_group_n_to_page_n
IS 'Table located group on page for client information.';

COMMENT ON COLUMN icredit.relation_group_n_to_page_n.id
IS 'Unique identified record in to table';

COMMENT ON COLUMN icredit.relation_group_n_to_page_n.contact_page_number
IS 'Number of page on client screen';

COMMENT ON COLUMN icredit.relation_group_n_to_page_n.contact_block_number
IS 'Number of group on page for client screen';

COMMENT ON COLUMN icredit.relation_group_n_to_page_n.sorting
IS 'sorting grops on client screen om page';

ALTER TABLE icredit.relation_group_n_to_page_n
  ADD CONSTRAINT fk_relation_group_n_to_page_n1 FOREIGN KEY (contact_page_number)
    REFERENCES icredit.dic_contacts_page_number(value)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE icredit.relation_group_n_to_page_n
  ADD CONSTRAINT fk_relation_group_n_to_page_n2 FOREIGN KEY (contact_block_number)
    REFERENCES icredit.dic_name_contacts_block(value)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;