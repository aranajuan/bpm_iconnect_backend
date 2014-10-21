<form id="form_action" >
    
    <div class="action_title">Establecer prioridad</div>
    <div class="action_detail">seleccione una prioridad para su staff sobre este tkt</div>
    <select name="prioridad" id="prioridad" class="multiselect_simple filter" >
        <option value="0">-</option>
        <option value="3">ALTA</option>
        <option value="6">MEDIA</option>
        <option value="9">BAJA</option>
    </select>
    <br />

</form>

<input type="button" class="button" value="Priorizar" onclick="GO('PRIORIZAR')" />

<script>
    function config(){
        build_buttons();
    }
</script>