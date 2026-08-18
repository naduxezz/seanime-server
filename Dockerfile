FROM alpine:latest

RUN apk add --no-cache ca-certificates curl libc6-compat

WORKDIR /app

RUN curl -L -o seanime.tar.gz https://github.com/5rahim/seanime/releases/download/v3.10.2/seanime-3.10.2_Linux_x86_64.tar.gz && tar -xzf seanime.tar.gz && rm seanime.tar.gz

# Create config dir and copy your saved state
RUN mkdir -p /root/.config/Seanime
COPY config.toml /root/.config/Seanime/config.toml
COPY seanime.db /root/.config/Seanime/seanime.db
ENV SEANIME_HOST=0.0.0.0
ENV SEANIME_PORT=43211

EXPOSE 43211

CMD ["./seanime", "--host", "0.0.0.0", "--port", "43211", "--password", "mypassword123"]
