<form id="form_action" >
    
    <div class="action_title">Asignar tkt a staff</div>
    <div class="action_detail">Seleccione el usuario a quien desea asignarle el tkt</div>
    <div id="txt_usuario"></div>
    <br />

</form>

<input type="button" class="button" value="Asignar" onclick="GO('ASIGNAR')" />

<script>
    function config(){
        $("#txt_usuario").idSEL({table:'teams_users',areas:$("#txt_area_select").val(),hide:user.id});
    }
</script>