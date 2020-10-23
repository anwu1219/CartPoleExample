#!/usr/bin/env bash

region=$1

./Marabou/src/engine/marabou.elf ./networks/cartpole_2layer_8node_classifier.nnet $region --dnc --num-workers=1 --initial-timeout=0 --initial-divides=0
