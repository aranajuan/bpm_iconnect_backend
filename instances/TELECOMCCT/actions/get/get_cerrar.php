<form id="form_action" >
    
    <div class="action_title">Cerrar tkt</div>
    <div class="action_detail">recuerda no publicar contrase&ntilde;as, para brindar esa informaci&oacute;n utilizar <b>Comentarios privados</b><br/><br/>
    	** Incluir el texto <b>no corresponde</b> en los casos que el reclamo no sea valido o no se este procediendo de manera correcta. **
    </div>
    
    <select name="cierre">
        <option value="Correcto">Correcto</option>
        <option value="Reingresar">Reingresar</option>
        <option value="No corresponde">No corresponde</option>
    </select>
    <textarea name="comentario" cols="90" rows="10"></textarea>
    <div class="action_detail">archivos a adjuntar</div>
    
    <div id="aa" class="PRINT">
</div>
</form>

<input type="button" class="button" value="Cerrar" onclick="GO('CERRAR')" />