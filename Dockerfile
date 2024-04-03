FROM alpine:latest

RUN apk add --no-cache git zsh bash python3 gcc sudo

# Set user and group
RUN addgroup -g 1000 dotbot
RUN adduser -G dotbot -D -u 1000 -h /home/user -s /bin/zsh user

# Switch to user
USER user:1000
WORKDIR /home/user
RUN pwd
RUN git clone https://github.com/bernhardrode/.dotfiles
# RUN .dotfiles/install
