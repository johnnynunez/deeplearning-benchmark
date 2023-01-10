#!/bin/bash

# PyTorch
rm -r examples
mkdir -p examples/gnmt/scripts
mkdir -p examples/transformer-xl
mkdir -p examples/tacotron2/scripts
mkdir -p examples/bert/data/squad
mdkir -p examples/ncf

cp /scripts/patch/wmt16_en_de.sh examples/gnmt/scripts
cp /scripts/patch/getdata.sh examples/transformer-xl
cp /scripts/patch/prepare_dataset.sh examples/tacotron2/scripts
cp /scripts/patch/squad_download.sh examples/bert/data/squad

./run_prepare_pytorch.sh
