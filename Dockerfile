FROM alpine:latest

RUN apk add git bash python3
# SHELL ["bash"]
WORKDIR /root
RUN git clone https://github.com/bernhardrode/.dotfiles
RUN .dotfiles/install
