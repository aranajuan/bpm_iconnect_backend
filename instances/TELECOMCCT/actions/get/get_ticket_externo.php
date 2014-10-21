<form id="form_action" >   
    <select id="ext_type_add" name="ext_type_add" class="multiselect_simple filter">
        <option value="ext_sd" >SD</option>
        <option value="ext_im" >IM</option>
        <option value="ext_rq_simplit">RQ SIMPLIT</option>
        <option value="ext_rq_needit" >RQ NEEDIT</option>
        <option value="ext_pm">PM</option>
    </select>
    <br />
    Numero: <input id="number_ext" name="number_ext" type="text" size="20" />
    <br />
</form>
<input type="button" class="button" value="Guardar" onclick="GO('TICKET_EXTERNO')" />


<script>

    function check_valid_form(){
        if(!IsNumeric($("#number_ext").val())){
            alert_p("El tkt debe ser un numero","Error");
            return false;
        }
        if(tktJ.extTKT.find($("#number_ext").val(),$("#ext_type_add").val())){
            alert_p("El tkt ya esta adjunto","Error");
            return false;
        }
        return true;
    }

</script>