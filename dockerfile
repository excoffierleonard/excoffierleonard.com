FROM rust:slim AS builder
WORKDIR /app
RUN apt update && apt install -y perl make g++
RUN rustup target add wasm32-unknown-unknown
RUN cargo install cargo-leptos
COPY . .
RUN cargo leptos build --release

FROM debian:stable-slim AS runtime
ENV RUST_LOG="info"
ENV LEPTOS_SITE_ADDR="0.0.0.0:8080"
ENV LEPTOS_SITE_ROOT="site"
WORKDIR /app
COPY --from=builder /app/target/release/excoffierleonard_com .
COPY --from=builder /app/target/site ./site
EXPOSE 8080
CMD ["./excoffierleonard_com"]