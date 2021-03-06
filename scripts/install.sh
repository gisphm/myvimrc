#!/bin/sh
#
# Copyright 2015 gisphm <phmfk@hotmail.com>
# Author: gisphm <phmfk@hotmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

mkdir -p ~/.vim/session
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/tmp/backup
mkdir -p ~/.vim/tmp/swap
mkdir -p ~/.vim/tmp/undo
mkdir -p ~/.vim/tmp/view
mkdir -p ~/.vim/plugged

#[[ -d ~/.vim/bundle/neobundle.vim/ ]] || git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
