use Test2::V0;
use Test::Alien;
use lib -d '../t' ? './lib' : 't/lib';
use Alien::libsdl2_image;
use Config;
#
alien_ok 'Alien::libsdl2_image';
my $flags = `perl -MExtUtils::Embed -e ccopts -e ldopts`;

#  nasty hack
#$ENV{LD_LIBRARY_PATH}   = Alien::libsdl2_image->dist_dir . '/lib';
#$ENV{DYLD_LIBRARY_PATH} = Alien::libsdl2_image->dist_dir . '/lib';
#
#diag( 'dist_dir: ' . Alien::libsdl2_image->dist_dir . '/lib' );
#diag( 'libs: ' . Alien::libsdl2_image->libs );
#diag( 'cflags: ' . Alien::libsdl2_image->cflags );
#diag( 'cflags static: ' . Alien::libsdl2_image->cflags_static );
#eval { diag( 'dynamic libs: ' . join ':', Alien::libsdl2_image->dynamic_libs ); };
#warn $@ if $@;
#diag( 'bin dir: ' . join( ' ', Alien::libsdl2_image->bin_dir ) );
#
my $xs = {
    verbose => 1,
    xs      => do { local $/; <DATA> }
};
#
todo 'Includes/cflags are missing' => sub {
    xs_ok $xs, with_subtest {
        is SDL2_imageTest::get_ver(), 2;
    }
};
#
done_testing;
__DATA__
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>


MODULE = SDL2_imageTest PACKAGE = SDL2_imageTest

int
get_ver()
	CODE:
			SDL_version compiled;
			SDL_IMAGE_VERSION(&compiled);
			printf("# [TA_MODULE] We compiled against SDL_image version %d.%d.%d ...\n",
				compiled.major, compiled.minor, compiled.patch);
			RETVAL = compiled.major;
	OUTPUT:
		RETVAL
