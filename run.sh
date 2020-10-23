#!/usr/bin/env bash

if [ ! -f Marabou/src/engine/marabou.elf ]; then
    git clone https://github.com/anwu1219/Marabou/
    cd Marabou
    git checkout inductive-classify
    cd src/engine
    make -j4
    cd ../../../
fi

if [ -d dump/ ]; then
    rm -rf dump/
fi

mkdir dump/

echo "The network takes in a state and outputs two scores, one for applying control clockwise, one for applying control counter-clockwise"
echo ""
echo "Partitioning input regions and identifying invariant sub-regions S where the transition system maps S to itself..."
./Marabou/src/engine/marabou.elf ./networks/cartpole_2layer_8node_classifier.nnet ./networks/empty_property.txt --dnc --num-workers=1 --tree-depth=5 --initial-divides=0 --num-online-divides=2

echo "done!"
echo ""

echo "Printing out the partitions of the input region. Each partition S is contained in a file, suffixed either with hold, denoting S is an invariant region, or nothold, denoting it is not."
echo ""
ls dump/*
