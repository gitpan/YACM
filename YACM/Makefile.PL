use 5.000000;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'YACM',
    VERSION_FROM      => 'lib/YACM.pm', # finds $VERSION
    PREREQ_PM         => {"YAML" => "0.84"}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/YACM.pm', # retrieve abstract from module
       AUTHOR         => 'apioli <apioli@cpan.org>') : ()),
);
