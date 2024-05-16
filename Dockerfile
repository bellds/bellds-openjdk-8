FROM quay.io/openshift/origin-cli:latest AS oc-cli-builder

RUN oc version && \
    kubectl version --client=true

# Now create the improved image
FROM registry.access.redhat.com/ubi8/openjdk-8:latest

# Install the OpenShift (oc) cli
COPY --from=oc-cli-builder /usr/bin/oc /usr/bin/kubectl /usr/bin/
