package com.cloudarch.upload.dto;

import java.util.UUID;

public record FileUploadedEvent(
    UUID fileId,
    String filename,
    String contentType,
    Long sizeBytes,
    String bucket,
    String objectKey
) {}
