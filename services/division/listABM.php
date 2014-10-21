<?php
require_once   "general_includes.php";
require_once 'classes/division.php';
$DIVALL = new DIVISION();
$DIVALL_v = $DIVALL->list_all();
if($DIVALL_v){
    ?>
    
<table id="ABM_List" class="display">
    <thead>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>WI</th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <?
    foreach($DIVALL_v as $d){
        ?>
    <tr>
        <td><?=$d->get_prop("id");?></td>
        <td><?=$d->get_prop("nombre");?></td>
        <td><?=maxLenShow($d->get_prop("linkwi"),40);?></td>
        <td><img class="img_lnk" src="<?=HIMG_DIR.'/b_edit.png'?>" onclick="load_update(<?=$d->get_prop("id");?>,'<?=strToJava($d->get_prop("nombre"));?>','<?=strToJava($d->get_prop("linkwi"));?>')" /></td>
        <td><img class="img_lnk" src="<?=HIMG_DIR.'/b_drop.png'?>" onclick="reg_delete(<?=$d->get_prop("id");?>)" /></td>
    </tr>
        <?
    }
    
}
?>
    </tbody>
</table>