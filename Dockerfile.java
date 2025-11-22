FROM abhishek1009/ubuntu:latest

# 1. Define Java Version Argument
# You can override this: docker build --build-arg JAVA_VERSION=21 .
# Note: Ensure the version exists in Ubuntu apt (e.g., 17, 21, etc.)
ARG JAVA_VERSION=25
ARG MAVEN_VERSION=3.9.11
ARG GRADLE_VERSION=9.2.1

ENV DEBIAN_FRONTEND=noninteractive

# 2. Install OpenJDK via apt-get
# We also install unzip/wget here to handle Maven/Gradle later.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openjdk-${JAVA_VERSION}-jdk \
    unzip \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 3. Install Maven & Gradle (Manual Install)
# We KEEP this manual because 'apt-get install maven' on Ubuntu gives old versions.
RUN wget https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -P /tmp && \
    tar xf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven && \
    \
    wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp && \
    unzip -d /opt /tmp/gradle-${GRADLE_VERSION}-bin.zip && \
    ln -s /opt/gradle-${GRADLE_VERSION} /opt/gradle && \
    \
    rm /tmp/*.zip /tmp/*.tar.gz

# 4. Configure Environment Variables
# Ubuntu installs OpenJDK at: /usr/lib/jvm/java-XX-openjdk-amd64
ENV JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-amd64
ENV MAVEN_HOME=/opt/maven
ENV GRADLE_HOME=/opt/gradle

# 5. Update System PATH
ENV PATH="$JAVA_HOME/bin:$MAVEN_HOME/bin:$GRADLE_HOME/bin:$PATH"

# Expose ports
EXPOSE 8000-9000
