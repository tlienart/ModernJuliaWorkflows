#! /bin/bash
asciinema rec ./output/pkgmode.cast --overwrite --command='julia --project=@. ./pkgmode.jl' -i=1
asciinema rec ./output/helpmode.cast --overwrite --command='julia --project=@. ./helpmode.jl' -i=1

agg ./output/pkgmode.cast ./output/pkgmode.gif --font-size 25
agg ./output/helpmode.cast ./output/helpmode.gif --font-size 25