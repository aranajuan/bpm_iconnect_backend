<?php
require_once   "general_includes.php";
require_once  'classes/listin.php';
$LISTINALL = new LISTIN();
$LISTINALL_v = $LISTINALL->list_all();
if($LISTINALL_v){
    ?>
    
<table id="ABM_List" class="display">
    <thead>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>TO</th>
            <th>CC</th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <?
   foreach($LISTINALL_v as $l){
        ?>
    <tr>
        <td><?=$l->get_prop("id");?></td>
        <td><?=$l->get_prop("nombre");?></td>
        <td><?=maxLenShow($l->get_prop("too"),40);?></td>
        <td><?=maxLenShow($l->get_prop("cc"),40);?></td>
        <td><img class="img_lnk" src="<?=HIMG_DIR.'/b_edit.png'?>" onclick="load_update(<?=$l->get_prop("id");?>,'<?=strToJava($l->get_prop("nombre"));?>','<?=strToJava($l->get_prop("too"));?>','<?=strToJava($l->get_prop("cc"));?>')" /></td>
        <td><img class="img_lnk" src="<?=HIMG_DIR.'/b_drop.png'?>" onclick="reg_delete(<?=$l->get_prop("id");?>)" /></td>
    </tr>
        <?
    }
    
}
?>
    </tbody>
</table>