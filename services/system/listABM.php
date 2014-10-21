<?php
require_once   "general_includes.php";
require_once 'classes/system.php';
$SYSALL = new SYSTEM();
$SYSALL_v = $SYSALL->list_all();
if($SYSALL_v){
    ?>
    
<table id="ABM_List" class="display">
    <thead>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <?
    foreach($SYSALL_v as $s){
        ?>
    <tr>
        <td><?=$s->get_prop("id");?></td>
        <td><?=$s->get_prop("nombre");?></td>
        <td><img class="img_lnk" src="<?=HIMG_DIR.'/b_edit.png'?>" onclick="load_update(<?=$s->get_prop("id");?>,'<?=strToJava($s->get_prop("nombre"));?>')" /></td>
        <td><img class="img_lnk" src="<?=HIMG_DIR.'/b_drop.png'?>" onclick="reg_delete(<?=$s->get_prop("id");?>)" /></td>
    </tr>
        <?
    }
    
}
?>
    </tbody>
</table>