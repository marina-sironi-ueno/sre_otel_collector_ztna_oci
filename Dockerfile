# Dockerfile
FROM otel/opentelemetry-collector-contrib:latest

# Copiamos el config
COPY config/config.yaml /etc/otelcol-contrib/config.yaml

# Salud del contenedor
HEALTHCHECK --interval=30s --timeout=5s --start-period=20s \
  CMD /otelcol-contrib --config=/etc/otelcol-contrib/config.yaml --dry-run || exit 1

EXPOSE 8080 55679 1777

# Comando por defecto
CMD ["--config=/etc/otelcol-contrib/config.yaml"]