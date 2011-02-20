function observer(){
    timer = setTimeout('observer()',5000);
    $(".content").each(function(){
        var login = this.id;
        $.ajax({
            url:"/show/" + login, 
            type: "GET",
            success: function(result){
                $("#"+login).html(result);
            } 
        });
    });
}

