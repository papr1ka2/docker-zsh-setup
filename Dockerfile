FROM ubuntu:22.04
LABEL maintainer="papr1ka2"
COPY .p10k.zsh /root/.p10k.zsh
COPY .zshrc /root/.zshrc
RUN apt -y update && apt -y install zsh python3 wget curl git
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions