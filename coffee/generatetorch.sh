#!/bin/zsh

echo generate torch graphs

foreach mode ( \
  ideal locking finelocking parsteam americano espresso \
  multi-1 multi-2 multi-4 multi-8 \
  linearpipe-0 linearpipe-1 linearpipe-10 \
  splitpipe-0 splitpipe-1 splitpipe-10 \
  )
go run *.go --dur=3s --par=0 --trace=./trace-$mode.out -mode=$mode
go tool trace --pprof=sync ./trace-$mode.out > ./sync-$mode.pprof
go tool pprof -svg ./sync-$mode.pprof > ./torch-$mode.svg
end
