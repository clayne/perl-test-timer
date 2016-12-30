
use strict;
use Test::Exception;
use Test::More tests => 3;

BEGIN { use_ok('Test::Timer'); }

$Test::Timer::alert = 1;

throws_ok(
    sub {
        Test::Timer::_benchmark( sub { sleep(20); }, 1 );
    },
    qr/Execution exceeded threshold and timed out/,
    'Caught timeout exception'
);

$Test::Timer::alert = 6;

throws_ok(
    sub {
        Test::Timer::_benchmark( sub { sleep(20); }, 1 );
    },
    qr/Execution exceeded threshold and timed out/,
    'Caught timeout exception'
);
