CREATE TABLE processed_state (
    flight_id      VARCHAR(16),
    callsign       VARCHAR(16),
    origin_country VARCHAR(64),
    lat            DOUBLE PRECISION,
    lon            DOUBLE PRECISION,
    alt            DOUBLE PRECISION,
    speed          DOUBLE PRECISION,
    timestamp      TIMESTAMPTZ,
    PRIMARY KEY (flight_id, timestamp)
);
