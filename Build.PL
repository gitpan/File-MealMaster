# @(#)$Ident: Build.PL 2013-08-07 10:00 pjf ;

use strict;
use warnings;
use inc::Bob; # Module::Build subclass
use version; our $VERSION = qv( sprintf '0.18.%d', q$Rev: 1 $ =~ /\d+/gmx );

Bob->new( {
   module    => 'File::MealMaster',
   home_page => 'http://www.roxsoft.co.uk',
   requires  => {
      'perl'             => 5.010001,
      'namespace::clean' => 0.23,
      'namespace::sweep' => 0.006,
      'parent'           => 0.224,
      'Class::Method::ModifiersX::Augment' => 0.001,
      'File::DataClass'  => q(0.22.0),
      'MealMaster'       => 0.28,
      'Moo'              => 1.002,
      'Template'         => 2.22, },
   recommends            => {
      'App::cpanminus'   => 1.6005, },
   configure_requires    => {
      'version'          => 0.88,
      'Module::Build'    => 0.4004, },
   build_requires        => {
      'version'          => 0.88,
      'Module::Build'    => 0.4004,
      'Text::Diff'       => 1.37, },
} )->create_build_script; # Goal!

# Local Variables:
# eval: (load-project-state "file-mealmaster")
# mode: perl
# tab-title: File::MealMaster
# tab-width: 3
# End:
