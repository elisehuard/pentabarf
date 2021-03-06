
CREATE TABLE base.role_localized (
  role TEXT NOT NULL,
  translated TEXT NOT NULL,
  name TEXT NOT NULL
);

CREATE TABLE auth.role_localized (
  PRIMARY KEY( role, translated ),
  FOREIGN KEY( role ) REFERENCES auth.role( role ) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY( translated ) REFERENCES language( language ) ON UPDATE CASCADE ON DELETE CASCADE
) INHERITS( base.role_localized );

CREATE TABLE log.role_localized (
) INHERITS( base.logging, base.role_localized );

CREATE INDEX log_role_localized_role_idx ON log.role_localized( role );
CREATE INDEX log_role_localized_log_transaction_id_idx ON log.role_localized( log_transaction_id );

