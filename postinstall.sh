#!/bin/bash
#sudo apt install build-essential cmake python3-dev libclang1
#sudo dnf install -y cmake python3-devel clang-devel
#rustup component add rls, rust-src
#
#cd ～/.vim/bundle/YouCompleteMe
#git submodule update --init --recursive
#./install.py --clang-completer --system-libclang    ## 这两个参数主要是为了方便C语言的补全
## 请注意不需要 --rust-completer，因为该参数会使得 install.py/build.py 自动下载特定版本的rustup toolchain，然后编译生成 RLS 组件，费时费力
#
cd ~/.vim/bundle/YouCompleteMe
sed -i "s/^RUSTC_EXECUTABLE.*/RUSTC_EXECUTABLE = utils.PathToFirstExistingExecutable([os.path.join(RLS_BIN_DIR, 'rustc'), 'rustc'])/g" ./third_party/ycmd/ycmd/completers/rust/rust_completer.py
sed -i "s/^RLS_EXECUTABLE.*/RLS_EXECUTABLE = utils.PathToFirstExistingExecutable([os.path.join(RLS_BIN_DIR, 'rls'), 'rls'])/g" ./third_party/ycmd/ycmd/completers/rust/rust_completer.py
