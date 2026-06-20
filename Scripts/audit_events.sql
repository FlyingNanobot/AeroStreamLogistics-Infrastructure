CREATE TABLE audit_events (
    event_id        VARCHAR(50) PRIMARY KEY,   -- unique identifier for the audit event
    flight_id       VARCHAR(20) NOT NULL,      -- link to flight being audited
    severity        VARCHAR(20) NOT NULL,      -- e.g. 'Info', 'Warning', 'Critical'
    message         TEXT NOT NULL,             -- human-readable description
    timestamp       TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    metric          VARCHAR(50),               -- optional: which metric triggered event
    current_value   VARCHAR(50),               -- optional: value at time of event
    threshold       VARCHAR(50),               -- optional: threshold that was crossed
    created_by      VARCHAR(50) DEFAULT 'system', -- who logged the event
    processed       BOOLEAN DEFAULT FALSE      -- flag for downstream processing/billing
);
