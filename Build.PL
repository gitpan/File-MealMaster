# @(#)$Ident: Build.PL 2013-04-16 11:19 pjf ;

use strict;
use warnings;
use inc::Bob; # Module::Build subclass
use version; our $VERSION = qv( sprintf '0.16.%d', q$Rev: 5 $ =~ /\d+/gmx );

Bob->new( {
   module    => q(File::MealMaster),
   home_page => q(http://www.roxsoft.co.uk),
   requires  => {
      'perl'                 => 5.010,
      'namespace::autoclean' => 0.13,
      'namespace::clean'     => 0.22,
      'parent'               => 0.224,
      'version'              => 0.77,
      'File::DataClass'      => q(0.16.0),
      'MealMaster'           => 0.28,
      'Moose'                => 2.0801,
      'Template'             => 2.18,
      'Template::Stash'      => 2.9,
   },
   recommends            => {
      'App::cpanminus'   => 1.6005,
      'Date::Format'     => 2.24,
      'Pod::Markdown'    => 1.322,
      'Module::Metadata' => 1.000011, },
   configure_requires    => {
      'version'          => 0.77,
      'Module::Build'    => 0.38, },
   build_requires        => {
      'Exception::Class' => 1.23,
      'Test::More'       => 0.74,
      'Text::Diff'       => 1.37, },
} )->create_build_script; # Goal!

# Local Variables:
# eval: (load-project-state "file-mealmaster")
# mode: perl
# tab-title: File::MealMaster
# tab-width: 3
# End:
