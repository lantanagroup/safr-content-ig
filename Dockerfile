FROM lantanagroup/measure-builder:latest AS build

WORKDIR /work
COPY . .

# Create work dir for the publisher
RUN mkdir -p /work/fhir-cache
ENV JAVA_TOOL_OPTIONS="-Duser.home=/work/fhir-cache -Dfile.encoding=UTF-8"

RUN bash _updatePublisher.sh --yes
RUN bash _updateCQFTooling.sh --yes
RUN sushi .
RUN bash _refresh.sh
RUN bash _genonce.sh -no-sushi

# Python Fix Accessibilities
RUN python -m pip install --upgrade pip && pip install lxml
RUN python ./ci-scripts/fix_accessibilities.py

# --- Final stage (non-root NGINX) ---
FROM nginx:1.28.1-alpine

# Copy site content
COPY --from=build /work/output/. /usr/share/nginx/html/
COPY --from=build /work/bundles /usr/share/nginx/html/bundles
COPY nginx.default.conf /etc/nginx/conf.d/default.conf
# Downloads rename
COPY mv output/package.tgz output/gov.cdc.nhsn.safr.r4.tgz

# Use non-root user
USER nginx

# Expose port
EXPOSE 80

# Let nginx run as non-root (requires nginx config change, see below)
CMD ["nginx", "-g", "daemon off;"]
