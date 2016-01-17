-- Table: icredit.role

ALTER TABLE icredit.role
  ADD CONSTRAINT fk_role_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE icredit.role      
  ADD CONSTRAINT fk_role_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

COMMENT ON CONSTRAINT fk_role_to_created_by ON icredit.role IS '—сылка на справочник icredit.users';
COMMENT ON CONSTRAINT fk_role_to_lb_by ON icredit.role IS '—сылка на справочник icredit.users';