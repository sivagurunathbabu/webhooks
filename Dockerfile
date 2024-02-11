# Use an official Jenkins base image
FROM jenkins/jenkins:lts

# Switch to root user to install additional tools
USER root

# Install OpenJDK
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk

# Install Maven
ARG MAVEN_VERSION=3.8.4
ARG USER_HOME_DIR="/root"
ARG SHA=03e45a1c411ec609c07ef677d65f61f1f0e01505118f66a53d8afed6b7bf30b9
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

# Switch back to the Jenkins user
USER jenkins

# Install Jenkins plugins (if needed)
# Example:
# RUN /usr/local/bin/install-plugins.sh <plugin1> <plugin2>

# Copy your Jenkins job configurations, if any
# COPY jobs/ /var/jenkins_home/jobs/


# Expose the necessary ports
EXPOSE 8080
EXPOSE 50000

# Start Jenkins
CMD ["/usr/local/bin/jenkins.sh"]
