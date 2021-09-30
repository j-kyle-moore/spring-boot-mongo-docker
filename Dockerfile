ARG BASE_REGISTRY=registry.access.redhat.io
ARG BASE_IMAGE=rhel7
ARG BASE_TAG=7.9-476
FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

#register the container
RUN subscription-manager register --org="7321747|rancher-containers" --activationkey="eyJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIzNTZkODRlOWQyNDI0ODRmOWIwODkyOTNhNzU0NDNiNyJ9.oDZqOaYxLQuTV0jvEYu71NdGeKou-DCimAUiL-5_hlxk5YaFVw5HKFicJW5eQjFvZnCpTu3_fawNgNb6-LEIIk8taIWFKRrMZn1wSRTfdP2UFluirVOF1roQ7gTqNWpy3UejILpfebjP4vbwIRk6yXYwP-wd6rkC1BG6xtOfTrbeluczHdtrPXWLB-EKW2nx3OG3yMiEDN4QnrEz5Vzvog8eTz0luhcH7us61zSQgzs24uzOLXJg0ShWWsW5R1_4wMdCpQvKA2ZWkHWd9NpAmCshToNc5stqaRAGDJb07XZrNyMW8nOefUf1tiiY3RuQ_yL2As78ChefkzDqEgkEjN-Cct1ulW627zS1ZUYsadikt4JJodPb3aG_l7n25n6EgABSUHMoogU62a415e74LOJZgm2sbuUPOPGji7LgZx2OEj0nRYGkUfcaSte8o5mgl24v6j40sQDWL0qlwo5IRZe8TZ6sZLnmx3PH5if8zab7KFwYnrkKTKEhxsl6rj4_rnZGHhAlmifhPYU582bkrTfwXXXtYQ1cLFd4s_8LCxi8LGIPjFYxVxfqFJCym08IqNjabvBuxAyk--YacjTx7crEwMpUZIkik1dyV4tlOl_dAuS0RECYu6Uw0DcejV6XLC7hNDR7CJ_YdopGrJbIq9-hOZoqk6r2G_0ASOX7C-w"

# Required for starting application up.
RUN yum update && yum add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/spring-boot-mongo-1.0.jar $PROJECT_HOME/spring-boot-mongo.jar

WORKDIR $PROJECT_HOME

CMD ["java" ,"-jar","./spring-boot-mongo.jar"]
