<form id="form_action" >
    
    <div class="action_title">Derivar a otro equipo</div>
    <div class="action_detail">seleccione un equipo de destino</div>
    <div id="txt_equipo"></div>
    <textarea name="comentario" cols="90" rows="10"></textarea><br />
    <br />

</form>

<input type="button" class="button" value="Derivar" onclick="GO('DERIVAR')" />

<script>
    function config(){
        $("#txt_equipo").idSEL({table:'teams_type',tipo:'GRUPO_IT',hide:tktJ.idequipo});
    }
</script>