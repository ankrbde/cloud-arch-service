package com.cloudarch.upload.domain;

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import jakarta.persistence.*;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "file_metadata")
public class FileMetadata extends PanacheEntityBase {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id", updatable = false, nullable = false)
    public UUID id;

    @Column(name = "filename", nullable = false)
    public String filename;

    @Column(name = "content_type", nullable = false)
    public String contentType;

    @Column(name = "size_bytes", nullable = false)
    public Long sizeBytes;

    @Column(name = "bucket", nullable = false)
    public String bucket;

    @Column(name = "object_key", nullable = false)
    public String objectKey;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    public FileStatus status = FileStatus.UPLOADED;

    @Column(name = "uploaded_at", nullable = false)
    public OffsetDateTime uploadedAt = OffsetDateTime.now();

    @Column(name = "processed_at")
    public OffsetDateTime processedAt;

    @Column(name = "error_message")
    public String errorMessage;

    public static List<FileMetadata> findByStatus(FileStatus status) {
        return list("status", status);
    }
}
