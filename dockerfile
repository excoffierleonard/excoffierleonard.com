FROM rust:slim AS builder
WORKDIR /app
RUN apt update && apt install -y perl make g++
RUN rustup target add wasm32-unknown-unknown
RUN cargo install cargo-leptos
COPY . .
RUN cargo leptos build --release

FROM debian:stable-slim AS runtime
WORKDIR /app
COPY --from=builder /app/target/release/excoffierleonard_com .
COPY --from=builder /app/target/site ./site
CMD ["./excoffierleonard_com"]