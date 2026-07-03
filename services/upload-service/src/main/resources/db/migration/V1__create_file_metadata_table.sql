CREATE TABLE file_metadata (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    filename     VARCHAR(255)  NOT NULL,
    content_type VARCHAR(100)  NOT NULL,
    size_bytes   BIGINT        NOT NULL,
    bucket       VARCHAR(100)  NOT NULL,
    object_key   VARCHAR(500)  NOT NULL,
    status       VARCHAR(50)   NOT NULL DEFAULT 'UPLOADED',
    uploaded_at  TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    processed_at TIMESTAMPTZ,
    error_message TEXT
);

CREATE INDEX idx_file_metadata_status ON file_metadata (status);
CREATE INDEX idx_file_metadata_uploaded_at ON file_metadata (uploaded_at DESC);
