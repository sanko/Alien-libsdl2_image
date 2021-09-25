package Init {
    use strict;
    use warnings;
    use FFI::Platypus 1.00;
    use Test2::V0;
    our $VERSION = '1.00';
    {
        my $ffi = FFI::Platypus->new( api => 1 );
        $ffi->bundle();
        $ffi->attach( Log      => ['string'] => 'int' );
        $ffi->attach( IMG_Init => ['int']    => 'int' );
        $ffi->attach( IMG_Quit => [] );
        ok Log('bundle');
        ok IMG_Init(1);
        IMG_Quit();
    }
};
1;
