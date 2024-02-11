# Use an official Jenkins base image that includes OpenJDK
FROM jenkins/jenkins:lts-jdk11

# Switch to root user to install additional tools
USER root

# Install Maven
ARG MAVEN_VERSION=3.8.4
ARG USER_HOME_DIR="/root"

RUN apt-get update && \
    apt-get install -y curl && \
    mkdir -p /usr/share/maven /usr/share/maven/ref && \
    curl -fsSL -o /tmp/apache-maven.tar.gz https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 && \
    rm -f /tmp/apache-maven.tar.gz && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

# Switch back to the Jenkins user
USER jenkins

# Install Jenkins plugins (if needed)
# Example:
# RUN /usr/local/bin/install-plugins.sh <plugin1> <plugin2>

# Copy your Jenkins job configurations, if any
# COPY jobs/ /var/jenkins_home/jobs/

# You can add additional customization or configurations here

# Expose the necessary ports
EXPOSE 8080
EXPOSE 50000

# Start Jenkins
CMD ["/usr/local/bin/jenkins.sh"]
