#!/bin/bash
## Crafted (c) 2021 by Daitanlabs - We are stronger together
## Prepared : Roberto Nogueira
## File     : rubyfn
## Project  : project-bash-with-ruby
## Reference: bash
## Depends  : ruby
## Purpose  : Help to manage ordinary things.

# set -x

# rubyfn: declare a bash function in ruby! (obviates the need to use a file to hold the script)
rubyfn () {
  local declaration="function $1 {
    ruby - \"\$@\" <<END
      $(cat -)
END
  }"
  
  eval "$declaration"
}

rubyfn buildpath <<END
    puts ARGV.collect { |s| s.split(':') }.flatten.uniq.join(':')
END

rubyfn appendpath <<END
    puts ARGV.collect { |s| s.split(':') }.flatten.reverse!.uniq.reverse!.join(':')
END

rubyfn megasena <<END
    puts (1..60).to_a.sample(6).sort
END

prepath() {
    export PATH=$(buildpath $@ $PATH)
}

postpath() {
    export PATH=$(appendpath $@ $PATH)
}