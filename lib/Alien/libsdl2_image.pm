package Alien::libsdl2_image;
use strict;
use warnings;
use base qw[Alien::Base];
our $VERSION = '1.00';
#
use Alien::libsdl2;
use Env qw[@PATH];
unshift @PATH, Alien::libsdl2->bin_dir;
#
1;
__END__

=encoding utf8

=head1 NAME

Alien::libsdl2_image - Find or download and install SDL2_image

=head1 SYNOPSIS

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

=head1 DESCRIPTION

This package can be used by other L<CPAN|https://metacpan.org> modules that
require L<SDL2_image|https://www.libsdl.org/projects/SDL_image/>.

=head1 SEE ALSO

=over

=item L<libsdl2|http://libsdl.org>

=item L<Alien::libsdl2>

=back

=head1 Platform Support

This dist has been tested on various modern versions of perl on Windows Server
2019, Ubuntu (20.04.2), and OSX (10.15.7). See
https://github.com/sanko/Alien-libsdl2_image/actions

=head1 LICENSE

Copyright (C) Sanko Robinson.

This library is free software; you can redistribute it and/or modify it under
the terms found in the Artistic License 2. Other copyrights, terms, and
conditions may apply to data transmitted through this module.

=head1 AUTHOR

Sanko Robinson E<lt>sanko@cpan.orgE<gt>

=cut
