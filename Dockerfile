FROM ubuntu:22.04
LABEL maintainer="papr1ka2"
RUN apt -y update
# install basic packages
RUN apt -y install zsh wget curl git build-essential
# install python3
RUN apt -y install python3 python3-pip
# install ohmyzsh, zsh themes and plugins
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# install rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
# copy zsh configurations
COPY .p10k.zsh /root/.p10k.zsh
COPY .zshrc /root/.zshrc
