# @(#)$Ident: MealMaster.pm 2013-07-30 10:26 pjf ;

package File::MealMaster;

use 5.01;
use namespace::sweep;
use version; our $VERSION = qv( sprintf '0.17.%d', q$Rev: 8 $ =~ /\d+/gmx );

use File::DataClass::Constants;
use File::DataClass::Types  qw( Str );
use File::MealMaster::Result;
use Moo;

extends q(File::DataClass::Schema);

has '+cache_attributes' => default => sub {
   (my $ns = lc __PACKAGE__) =~ s{ :: }{-}gmx; return { namespace => $ns, }
};

has '+cache_class' => default => 'none';

has '+result_source_attributes' => default => sub {
   { recipes          => {
      attributes      => [ qw(categories directions
                              ingredients title yield) ],
      defaults        => { categories => [], ingredients => [] },
      resultset_attributes => {
         result_class => q(File::MealMaster::Result), }, }, }
};

has '+storage_class' => default => '+File::MealMaster::Storage';

has 'source_name' => is => 'ro', isa => Str, default => 'recipes';

around 'source' => sub {
   my ($orig, $self) = @_; return $self->$orig( $self->source_name );
};

around 'resultset' => sub {
   my ($orig, $self) = @_; return $self->$orig( $self->source_name );
};

sub make_key {
   my ($self, $title) = @_; return $self->source->storage->make_key( $title );
}


1;

__END__

=pod

=encoding utf8

=head1 Name

File::MealMaster - OO access to the MealMaster recipe files

=head1 Version

This documents version v0.17.$Rev: 8 $ of L<File::MealMaster>

=head1 Synopsis

   use File::MealMaster;

   my $mealmaster_ref = File::MealMaster->new( $mealmaster_attributes );

=head1 Description

Extends L<File::DataClass::Schema>. Defines the C<recipes> result source

=head1 Configuration and Environment

Defines these attributes:

=over 3

=item C<cache_attributes>

=item C<cache_class>

=item C<result_source_attributes>

=item C<source_name>

Defaults to C<recipes>. The result source name in the schema definition

=back

Modifies these methods;

=over 3

=item C<resultset>

=item C<source>

=back

=head1 Subroutines/Methods

=head2 make_key

Exposes L<make_key|File::MealMaster::Storage/make_key>

=head1 Diagnostics

None

=head1 Dependencies

=over 3

=item L<File::DataClass::Schema>

=item L<File::MealMaster::Result>

=item L<File::MealMaster::Storage>

=item L<Moo>

=back

=head1 Incompatibilities

There are no known incompatibilities in this module

=head1 Bugs and Limitations

There are no known bugs in this module.
Please report problems to the address below.
Patches are welcome

=head1 Author

Peter Flanigan, C<< <pjfl@cpan.org> >>

=head1 License and Copyright

Copyright (c) 2013 Peter Flanigan. All rights reserved

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself. See L<perlartistic>

This program is distributed in the hope that it will be useful,
but WITHOUT WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE

=cut

# Local Variables:
# mode: perl
# tab-width: 3
# End:
