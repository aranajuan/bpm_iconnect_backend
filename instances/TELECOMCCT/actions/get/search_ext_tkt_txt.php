<script>

    function check_each(filter){
        var found=false;
        $(filter).each(function(){
            if(check_comment_ext($(this).val()))
                found = true;
            
        });
        return found;
    
    }

    function check_comment_ext(str){
        //buscar palabras de tkts 
        var Search_strings = new Array("SD","IM","TKT", "TICKET","RQ","PM"); // strings para pedir confirmacion
        str=" "+str.toLowerCase();
        var i = 0;
        for(i=0;i<Search_strings.length;i++){
            if(str.indexOf(Search_strings[i].toLowerCase())>0){
                return true;
            }
        }
        return false;
    
    
    }
    
    function check_tktext(){
        var is_ext=false;
        if(check_each('textarea')){
            is_ext=true;
        }
         if(is_ext){
                confirm_p("<b>Olvidaste anexar un ticket externo?</b><br/>Agregarlo te servira para darle seguimiento mas facilmente",
                    "Ticket externo",
                    function(){
                        get_form("TICKET_EXTERNO");
                    });
            }
        
    }

</script>
