package com.cloudarch.upload.config;

import io.smallrye.config.ConfigMapping;
import io.smallrye.config.WithDefault;

@ConfigMapping(prefix = "app.upload")
public interface S3Config {

    @WithDefault("uploads")
    String bucket();
}
