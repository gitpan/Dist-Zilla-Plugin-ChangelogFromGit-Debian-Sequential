
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Add changelog entries into debain/changelog",
  "AUTHOR" => "Sergei Svistunov <sergei-svistunov\@yandex.ru>",
  "BUILD_REQUIRES" => {
    "File::pushd" => 0,
    "Git::Wrapper" => 0,
    "Test::DZil" => 0,
    "Test::More" => "0.88",
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Zilla-Plugin-ChangelogFromGit-Debian-Sequential",
  "EXE_FILES" => [],
  "LICENSE" => "gpl",
  "NAME" => "Dist::Zilla::Plugin::ChangelogFromGit::Debian::Sequential",
  "PREREQ_PM" => {
    "DateTime::Format::Mail" => 0,
    "Debian::Control" => 0,
    "Dist::Zilla::File::InMemory" => 0,
    "Dist::Zilla::Plugin::ChangelogFromGit" => 0,
    "Dist::Zilla::Role::AfterRelease" => 0,
    "Dpkg::Changelog::Parse" => 0,
    "Moose" => 0,
    "Text::Wrap" => 0
  },
  "VERSION" => "0.3",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



