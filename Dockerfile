FROM alpine:latest

RUN apk add --no-cache git zsh bash python3 gcc sudo doas

# Set user and group
RUN addgroup -g 1000 dotbot
RUN adduser -G dotbot -D -u 1000 -h /home/user -s /bin/zsh user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user && chmod 0440 /etc/sudoers.d/user
RUN echo "permit persist :wheel" >> /etc/doas.d/doas.conf

# Switch to user
USER root
WORKDIR /home/user
RUN chown -R user:dotbot /home/user
USER user
RUN git clone https://github.com/bernhardrode/.dotfiles /home/user/.dotfiles
