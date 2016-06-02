<?php
function plugin_version_teamviewer()
{
return array('name' => 'teamviewer',
'version' => '1.0',
'author'=> 'Valentin DEVILLE',
'license' => 'GPLv2',
'verMinOcs' => '2.2');
}

function plugin_init_teamviewer()
{
$object = new plugins;
$object -> add_cd_entry("teamviewer","other");

$object -> sql_query("CREATE TABLE IF NOT EXISTS `teamviewer` (
                      `ID` INT(11) NOT NULL AUTO_INCREMENT,
                      `HARDWARE_ID` INT(11) NOT NULL,
                      `TWID` VARCHAR(255) DEFAULT NULL,
                      `VERSION` VARCHAR(255) DEFAULT NULL,
                      PRIMARY KEY  (`ID`,`HARDWARE_ID`)
                      ) ENGINE=INNODB;");

}

function plugin_delete_teamviewer()
{
$object = new plugins;
$object -> del_cd_entry("teamviewer");
$object -> sql_query("DROP TABLE `teamviewer`");

}