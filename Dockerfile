# Etapa 1: Construir o binário
FROM golang:1.21 AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Etapa 2: Criar a imagem final
FROM scratch
COPY --from=builder /app/main /main
ENTRYPOINT ["/main"]
