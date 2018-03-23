###############################################################################
## OCSINVENTORY-NG
## Copyleft Frank BOURDEAU 2018
## Web : http://www.ocsinventory-ng.org
##
## This code is open source and may be copied and modified as long as the source
## code is always made freely available.
## Please refer to the General Public Licence http://www.gnu.org/ or Licence.txt
################################################################################

package Ocsinventory::Agent::Modules::Teamviewer;

sub new {

    my $name="teamviewer"; # Name of the module

    my (undef,$context) = @_;
    my $self = {};

    #Create a special logger for the module
    $self->{logger} = new Ocsinventory::Logger ({
        config => $context->{config}
    });
    $self->{logger}->{header}="[$name]";
    $self->{context}=$context;
    $self->{structure}= {
        name => $name,
        start_handler => undef,    #or undef if don't use this hook
        prolog_writer => undef,    #or undef if don't use this hook
        prolog_reader => undef,    #or undef if don't use this hook
        inventory_handler => $name."_inventory_handler",    #or undef if don't use this hook
        end_handler => undef    #or undef if don't use this hook
    };
    bless $self;
}

######### Hook methods ############

sub teamviewer_inventory_handler {


     my $self = shift;
     my $logger = $self->{logger};
     my $common = $self->{context}->{common};

     $logger->debug("Yeah you are in teamviewer_inventory_handler:)");

     # test if ps command is available :)
     sub check {
         my $params = shift;
         my $common = $params->{common};

         $common->can_run("teamviewer");
     }
     
     my @teaminfo=`teamviewer info`;
     my $team_id;
     my $team_version;

     foreach my $line (@teaminfo){
         $team_id=$1 if ($line =~ /TeamViewer ID:(?:\033\[0m|\s)*(\d+)\s+/);
         $team_version=$1 if ($line =~ /TeamViewer(?:\033\[0m|\s)*(.*)\s+(?:\()/);
     } 

     # Suppress unused spaces
     $team_id =~ s/\s+//g;
     $team_version =~ s/\s+//g; 

     push @{$common->{xmltags}->{TEAMVIEWER}},
     {
         TWID => [$team_id],
         VERSION => [$team_version],
     };
}

1;
