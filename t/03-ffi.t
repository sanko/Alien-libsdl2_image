use Test2::V0;
use Test::Alien 1.90;
use lib -d '../t' ? './lib' : 't/lib';
use Alien::libsdl2_image;
#
#skip_all 'requires a shared object or DLL'
#    unless Alien::libsdl2_image->dynamic_libs;
#
#  nasty hack
#$ENV{LD_LIBRARY_PATH}   = Alien::libsdl2_image->dist_dir . '/lib';
#$ENV{DYLD_LIBRARY_PATH} = Alien::libsdl2_image->dist_dir . '/lib';
#
diag( 'dist_dir: ' . Alien::libsdl2_image->dist_dir . '/lib' );
diag( 'libs: ' . Alien::libsdl2_image->libs );
diag( 'cflags: ' . Alien::libsdl2_image->cflags );
diag( 'cflags static: ' . Alien::libsdl2_image->cflags_static );
eval { diag( 'Dynamic libs: ' . join ':', Alien::libsdl2_image->dynamic_libs ); };
warn $@ if $@;
diag( 'bin dir: ' . join( ' ', Alien::libsdl2_image->bin_dir ) );
alien_ok 'Alien::libsdl2_image';
ffi_ok {
    api          => 1,
    symbols      => ['IMG_Init'],
    experimental => 2,
    lib          =>  [ grep { /SDL2/ } Alien::libsdl2_image->dynamic_libs ]
    },
    with_subtest {
    my ($ffi) = @_;
    my $init = $ffi->function( IMG_Init => ['int'] => 'int' )->call(0);
    ok !$init, 'IMG_Init(...) returns okay';
    };
#
done_testing;
