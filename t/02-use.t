use strict;
use warnings;
use Test::More;
use Alien::libsdl2_image;
diag "Install type: " . Alien::libsdl2_image->install_type;
pass 'OK';
done_testing();
