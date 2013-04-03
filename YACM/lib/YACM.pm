package YACM;

use 5.014002;
use strict;
use warnings;
use YAML qw(Dump Bless DumpFile LoadFile);

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use YACM ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw( new fileName hash Read  Save SaveTo Get Add Replace Remove
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.2';


sub new {
   my ($class) = @_;
    my $self = {
        _fileName => undef,
        _hash => undef
    };
    bless $self, $class;
    return $self;
}

sub fileName {
    my ( $self, $fileName ) = @_;
    $self->{_fileName} = $fileName if defined($fileName);
    return $self->{_fileName};
}

sub hash {
    my ( $self, $hash ) = @_;
    $self->{_hash} = $hash;
    return $self->{_hash};
}
sub Read{
    my ( $self )=@_;
    $self->{_hash} = LoadFile($self->{_fileName});
    return $self->{_hash} ;
}

sub Save{
    my ( $self )=@_;
    DumpFile($self->{_fileName},$self->{_hash});
}

sub SaveTo{
    my ( $self,$file )=@_;
    DumpFile($file,$self->{_hash});
}

sub Get{
    my ( $self, $key ) = @_;
    my $thash = $self->{_hash} ;
    return $$thash{$key};
}

sub Add{
    my ( $self, $key, $val ) = @_;
    my $thash = $self->{_hash} ;
    $$thash{$key} = $val;
    $self->{_hash} = $thash;
    return $self->{_hash} ;
}

sub Replace{
    my ( $self, $key, $val ) = @_;
    return add($self,$key,$val);
}

sub Remove{
    my ( $self, $key  ) = @_;
    my $thash = $self->{_hash} ;
    delete $$thash{$key} ; 
    $self->{_hash} = $thash;
    return $self->{_hash} ;
}

1;
__END__


=head1 NAME

YACM - Yast Another Configuration Module 

=head1 SYNOPSIS

  use YACM;
  my $yacm = new YAMC();
  $yacm->fileName('/home/dexter/my.yml');
  my $hash = $yacm->Read();
  my $value = $yacm->get('key')

=head1 DESCRIPTION

	YACM is Perl extension for express use of YAML for configuration, in simpre and quickly mode.
	The YACM contains everything you need for access to configuration files written in YAML


=head2 EXPORT



=head3 new


	The constructor

=head3 fileName

	This is the setter for full file name for yml config file.
	Parameters
		fileName: file name complete with path

=head3 hash

	This is the setter for hash whit configuration.
	Parameters
		hash: The hash conteins configuration.

=head3 Read

	This is the method for reading configuration, the file name of configuration file mast be specified in fileName setter.
	The return value is an hash with all configuration.

=head3 Save

	This is the method for writing configuration, the file name of configuration file mast be specified in fileName setter 
	and the hash mast be specified in hash setter.

=head3 SaveTo

	This method is same to save, but have another parameters for specify another path for backup.


=head3 Get

	This is method for get an specify element
	Parameters
		Key: The Key of element
	Returns
		Value marked by key.

=head3 Add

	This is method for Add an new element
	Parameters
		Key: The Key of element
		Value: The value
 
=head3 Replace

	This is method for Replace an element
	Parameters
		Key: The Key of element
		Value: The value
 

=head3 Remove

	This is method for Remove an element
	Parameters
		Key: The Key of element
		 
 

=head1 SEE ALSO
 
See YAML documentetion for YAML specification 

Mailing list E<lt>yamc-mail@googlegroups.comE<gt>

L<Forum|/"https://groups.google.com/forum/#!forum/yamc-mail">
 

=head1 AUTHOR

apioli, E<lt>apioli@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by apioli

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
