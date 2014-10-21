<?php
require_once   "general_includes.php";
require_once  'classes/team.php';
$TEAMALL = new TEAM();
$TEAMALLALL_v = $TEAMALL->list_all();
if($TEAMALLALL_v){
    ?>
    
<table id="ABM_List" class="display">
    <thead>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>Direccion</th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <?
    foreach($TEAMALLALL_v as $t){
        ?>
    <tr>
        <td><?=$t->get_prop("id");?></td>
        <td><?=$t->get_prop("nombre");?></td>
        <td><?=maxLenShow($t->get_prop("direccionobj")->get_prop("nombre"),40);?></td>
        <td><img class="img_lnk" src="<?=HIMG_DIR.'/b_edit.png'?>" onclick="load_update(<?=$t->get_prop("id");?>,'<?=strToJava($t->get_prop("nombre"));?>','<?=strToJava($t->get_prop("t_conformidad"));?>',<?=strToJava($t->get_prop("iddireccion"));?>,'<?=strToJava($t->get_prop("idsequiposrelacion"));?>','<?=strToJava($t->get_prop("idsequiposvisible"));?>',<?=strToJava($t->get_prop("idlistin"));?>,<?=strToJava($t->get_prop("tipo"));?>)" /></td>
        <td><img class="img_lnk" src="<?=HIMG_DIR.'/b_drop.png'?>" onclick="reg_delete(<?=$t->get_prop("id");?>)" /></td>
    </tr>
        <?
    }
    
}
?>
    </tbody>
</table>