<form id="form_action" >
    
    <div class="action_title">Cerrar tkt</div>
    
    <table>
        <tr>
    		<td>
    		Cierre:
    		</td>
    		<td>
    		    <select name="cierre">
    	<option value=""></option>
        <option value="Corresponde">Corresponde</option>
        <option value="Corresponde. Ajuste General">Corresponde. Ajuste General</option>
        <option value="No corresponde">No corresponde</option>
        <option value="Rechazado error de formato">Rechazado error de formato</option>
    </select>
    		</td>
    	</tr>
    	<tr>
    		<td>
    		Q:
    		</td>
    		<td>
    		<input type="text" name="qcasos" size="30" />
    		</td>
    	</tr>
    	<tr>
    		<td>
    		Monto:
    		</td>
    		<td>
    		<input type="text" name="monto" size="30" />
    		</td>
    	</tr>
</table>
    <textarea name="comentario" cols="90" rows="10"></textarea>
    <div class="action_detail">archivos a adjuntar</div>
    
    <div id="aa" class="PRINT">
</div>
</form>

<input type="button" class="button" value="Cerrar" onclick="GO('CERRAR_COMISION')" />