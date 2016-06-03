<?php
/*
====================================================================================
 OCS INVENTORY PLUGINS
 Copyleft Valentin DEVILLE 2016 
 Web: http://www.ocsinventory-ng.org
 
This code is open source and may be copied and modified as long as the source code is always made freely available.
Please refer to the General Public Licence http://www.gnu.org/ or LiCENSE.MD
====================================================================================
*/

if(AJAX){
    parse_str($protectedPost['ocs']['0'], $params);
    $protectedPost+=$params;
    ob_start();
    $ajax = true;
}
else{
    $ajax=false;
}
    print_item_header("Teamviewer");

	if (!isset($protectedPost['SHOW'])){
        $protectedPost['SHOW'] = 'NOSHOW';
    }
	$form_name="teamviewer";
	$table_name=$form_name;
    $tab_options=$protectedPost;
    $tab_options['form_name']=$form_name;
    $tab_options['table_name']=$table_name;
    echo open_form($form_name);
	$list_fields = array(
        'ID' => 'TWID',
        'Version' => 'VERSION'
    );
    $list_col_cant_del=$list_fields;
    $default_fields= $list_fields;
    $sql=prepare_sql_tab($list_fields);

    $sql['SQL']  .= "FROM $table_name WHERE (hardware_id = $systemid)";
    array_push($sql['ARG'],$systemid);
    $tab_options['ARG_SQL']=$sql['ARG'];
    $tab_options['ARG_SQL_COUNT']=$systemid;
    ajaxtab_entete_fixe($list_fields,$default_fields,$tab_options,$list_col_cant_del);
    echo close_form();
    if ($ajax){
        ob_end_clean();
        tab_req($list_fields,$default_fields,$list_col_cant_del,$sql['SQL'],$tab_options);
        ob_start();
    }
