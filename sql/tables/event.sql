
CREATE TABLE event (
  event_id SERIAL NOT NULL,
  conference_id INTEGER NOT NULL,
  tag TEXT,
  title TEXT NOT NULL,
  subtitle TEXT,
  conference_track_id INTEGER,
  team_id INTEGER,
  event_type_id INTEGER,
  duration INTERVAL NOT NULL,
  event_origin_id INTEGER NOT NULL,
  event_state TEXT NOT NULL,
  event_state_progress_id INTEGER NOT NULL,
  language_id INTEGER,
  room_id INTEGER,
  day SMALLINT,
  start_time INTERVAL,
  abstract TEXT,
  description TEXT,
  resources TEXT,
  f_public BOOL NOT NULL DEFAULT FALSE,
  f_paper BOOL,
  f_slides BOOL,
  f_conflict BOOL NOT NULL DEFAULT FALSE,
  f_deleted BOOL NOT NULL DEFAULT FALSE,
  f_unmoderated BOOL NOT NULL DEFAULT FALSE,
  remark TEXT,
  submission_notes TEXT,
  actual_start TIMESTAMP WITH TIME ZONE,
  actual_end TIMESTAMP WITH TIME ZONE,
  last_modified TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  last_modified_by INTEGER,
  FOREIGN KEY (conference_id) REFERENCES conference (conference_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (conference_track_id) REFERENCES conference_track (conference_track_id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (team_id) REFERENCES team(team_id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (event_type_id) REFERENCES event_type (event_type_id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (event_origin_id) REFERENCES event_origin (event_origin_id) ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (event_state_progress_id) REFERENCES event_state_progress (event_state_progress_id) ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (language_id) REFERENCES language (language_id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (room_id) REFERENCES room (room_id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (last_modified_by) REFERENCES person (person_id) ON UPDATE CASCADE ON DELETE SET NULL,
  PRIMARY KEY (event_id)
) WITHOUT OIDS;

CREATE INDEX event_conference_id_index ON event(conference_id);
CREATE INDEX event_event_state_id_index ON event(event_state_id);
CREATE INDEX event_event_state_progress_id_index ON event(event_state_progress_id);

