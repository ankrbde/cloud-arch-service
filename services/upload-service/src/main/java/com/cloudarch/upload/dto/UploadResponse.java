package com.cloudarch.upload.dto;

import com.cloudarch.upload.domain.FileStatus;
import java.time.OffsetDateTime;
import java.util.UUID;

public record UploadResponse(
    UUID id,
    String filename,
    String contentType,
    Long sizeBytes,
    String objectKey,
    FileStatus status,
    OffsetDateTime uploadedAt
) {}
