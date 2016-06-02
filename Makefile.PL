use strict;
use warnings;

use 5.8.8;
use ExtUtils::MakeMaker;

my %config = (
    'NAME'	   => 'AppConfig',
    'VERSION_FROM' => 'lib/AppConfig.pm', # finds $VERSION

    AUTHOR   => 'Andy Wardley <abw@wardley.org>',
    ABSTRACT => 'AppConfig is a bundle of Perl5 modules for reading configuration files and parsing command line arguments.',

    'PREREQ_PM'    => {
        'Test::More'    => 0,
    },
    'MAN3PODS' => {
        # We must explicitly name AppConfig.pm et al as manifyable files.
        # MakeMaker ignores files that match  /(config|setup).*\.pm/i;
        'lib/AppConfig.pm'  => '$(INST_MAN3DIR)/AppConfig.$(MAN3EXT)',
        map {
            ( "lib/AppConfig/${_}.pm",
              "\$(INST_MAN3DIR)/AppConfig::${_}.\$(MAN3EXT)" ) ;
        } qw( Args CGI File Getopt State Sys ),
    },
    'dist' => {
        'COMPRESS' => 'gzip',
        'SUFFIX'   => 'gz',
    },

    META_MERGE => {
        'meta-spec' => { version => 2 },
        dynamic_config => 0,
        resources => {
            repository  => {
                type => 'git',
                web  => 'https://github.com/neilbowers/AppConfig',
                url  => 'https://github.com/neilbowers/AppConfig.git',
            },
        },
    },

    TEST_REQUIRES => {
        'Test::More' => '0',
    },

    MIN_PERL_VERSION => '5.8.8',

    LICENSE => 'perl_5',
);


WriteMakefile(%config);
