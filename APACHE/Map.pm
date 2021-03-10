package Apache::Ocsinventory::Plugins::Teamviewer::Map;
 
use strict;
 
use Apache::Ocsinventory::Map;

$DATA_MAP{teamviewer} = {
    mask => 0,
    multi => 1,
    auto => 1,
    delOnReplace => 1,
    sortBy => 'TWID',
    writeDiff => 0,
    cache => 0,
    fields => {
        TWID => {},
        VERSION => {}
    }
};
1;
