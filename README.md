[![Actions Status](https://github.com/sanko/Alien-libsdl2_image/workflows/CI/badge.svg)](https://github.com/sanko/Alien-libsdl2_image/actions)
[![GitHub tag](https://img.shields.io/github/tag/sanko/Alien-libsdl2_image.svg)]()
[![Cpan version](https://img.shields.io/cpan/v/Alien-libsdl2_image.svg)](https://metacpan.org/release/Alien-libsdl2_image)

# NAME

Alien::libsdl2\_image - Find or download and install SDL2\_image

# SYNOPSIS

```perl
use strict;
use warnings;
use ExtUtils::MakeMaker;
use Config;
use Alien::Base::Wrapper ();
WriteMakefile(
  Alien::Base::Wrapper->new('Alien::libsdl2_image')->mm_args2(
    ...
    CONFIGURE_REQUIRES => {
      'Alien::libsdl2_image' => '0'
    },
    ...
  ),
);
```

# DESCRIPTION

This package can be used by other [CPAN](https://metacpan.org) modules that
require [SDL2\_image](https://www.libsdl.org/projects/SDL_image/).

# SEE ALSO

- [libsdl2](http://libsdl.org)
- [Alien::libsdl2](https://metacpan.org/pod/Alien%3A%3Alibsdl2)

# Platform Support

This dist has been tested on various modern versions of perl on Windows Server
2019, Ubuntu (20.04.2), and OSX (10.15.7). See
https://github.com/sanko/Alien-libsdl2\_image/actions

# LICENSE

Copyright (C) Sanko Robinson.

This library is free software; you can redistribute it and/or modify it under
the terms found in the Artistic License 2. Other copyrights, terms, and
conditions may apply to data transmitted through this module.

# AUTHOR

Sanko Robinson <sanko@cpan.org>
