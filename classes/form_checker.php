<?php

require_once 'classes/simple_html_dom.php';

/**
 * Toma dos html y verifica que se cumplan las clases requerido y numerico de los campos
 */
class form_checker {
    
    private $html_u; /* html ingresado por el usuario */
    private $html;  /* html de la opcion */
    private $remake; /* html final editado*/
    
    /**
     * Carga HTML de usuario y original -> valida
     * @param type $txt
     * @param type $original
     * @return type
     */
    function load_text($txt,$original){
        $html = new simple_html_dom();
        $html->load($txt);
        $this->html_u=$html;
        $this->load_original($original);
        return $this->is_valid();
    }
    
    /**
     * Carga HTML de la opcion y la cruza con la del usuario para asegurar las clases
     * @param type $txt
     */
    private function load_original($txt){
    
        $html = new simple_html_dom();
        $html->load($txt);
        $this->html=$html;
        $ELINPUT = $this->html_u->find('input, textarea');
        foreach($ELINPUT as $e_u){
            $elemOUT=$this->html->find("#".$e_u->getAttribute('id'));
            foreach($elemOUT as $e){
               if($e->tag=='input')
                $e->setAttribute('value',$e_u->getAttribute('value'));
               if($e->tag=='textarea')
                $e->innertext=$e_u->innertext;
            }
        }
        
    }
    
    /**
     * Valida todos los elementos
     * @return string error / ok
     */
    private function is_valid(){
        
        $details="";
        $elements= $this->html->find('input, textarea');
        foreach( $elements as $e ){
            
            $rta = $this->check_element($e); 
            if($rta!="ok"){
                $details.=$rta."<br>";
            }
            else{
                if($e->tag=="input")
                    $e->outertext= trim($e->getAttribute ('value'));
                else
                    $e->outertext=$e->innertext;
                        
            }
        }
        //Eliminar divs de print (Reemplazar por ver adjuntos)
        $ELINPUT = $this->html->find('div');
        foreach($ELINPUT as $e_u){
            $class= " ".$e_u->getAttribute('class');
            if(strpos($class,"PRINT") || strpos($class,"FILEUPL")){
                $e_u->outertext="<u>(ver adjuntos)</u>";
            }
        }
        
        if($details==""){
            
            $this->remake=$this->html;
            return "ok";
            
        }
        return $details;
    }
    
    /**
     * Arma JavaScript para validar formulario
     * @return string java
     */
    public function get_java_valid(){
        
        ob_start();
        ?>
        <script>
            function is_valid(){
                var errors="";

                $(".REQUERIDO").each(
                function(){
                    if($.trim($(this).val())=="")
                        errors=errors+"El campo "+$(this).attr("id")+" es obligatorio<br/>";
                }
                );
                $(".NUMERICO").each(
                function(){
                    if(checkNumeric({obj:$(this),correct:true,response:'change'})){
                        errors=errors+"El campo "+$(this).attr("id")+" fue corregido(punto marca decimal), por favor verificar si es correcto.<br/>";
                    }else{
                        if($.trim($(this).val())!="" && !IsNumeric($(this).val()))
                            errors=errors+"El campo "+$(this).attr("id")+" debe ser numerico<br/>";
                    }
                }
                );
                $("input").each(
                    function(){
                        if($(this).attr("type")!="file")
                            $(this).attr("value",$.trim($(this).val()));
                    }
                );
                $("textarea").each(
                    function(){
                        $(this).html($.trim($(this).val()));
                    }
                );
                if(errors=="")
                    return "ok";
                return errors;
                
            }
        </script>
        <?
        $script= ob_get_contents();
        ob_clean();
        return $script;
        
    }
    
    /**
     * Evalua si el elemento cumple con las clases asociadas, REQUERIDO NUMERICO ETC
     * @param type $e elemento DOM
     * @return string error de validacion / ok
     */
    private function check_element($e){
        if($e->tag=="input")
            $val=trim($e->getAttribute ('value'));
        if($e->tag=="textarea")
            $val=trim($e->innertext);
        $class= " ".$e->getAttribute ('class');
        if(strpos($class,'REQUERIDO') && $val=="")
                return $e->getAttribute ('id')." es un campo obligatorio";
        if(strpos($class,'NUMERICO') && !is_numeric($val) && trim($val)!="")
                return $e->getAttribute ('id')." es un campo numerico";
        return "ok";
    }
    
    /**
     * Devuelve texto de apertura sin inputs
     * @return string
     */
    function get_remake(){
     
     return $this->remake;   
        
    }
    
}

?>
