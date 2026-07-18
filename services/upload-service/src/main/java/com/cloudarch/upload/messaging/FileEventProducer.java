package com.cloudarch.upload.messaging;

import com.cloudarch.upload.dto.FileUploadedEvent;
import io.smallrye.reactive.messaging.MutinyEmitter;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import org.eclipse.microprofile.reactive.messaging.Channel;
import org.eclipse.microprofile.reactive.messaging.Emitter;

@ApplicationScoped
public class FileEventProducer {

    @Inject
    @Channel("file-uploaded")
    Emitter<FileUploadedEvent> emitter;

    public void send(FileUploadedEvent event) {
        emitter.send(event);
    }
}
