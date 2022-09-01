let index = {
    init: function () {
        $("#btn-declaration").on("click", () => {
            this.declaration();
        });
        $("#btn-declaration2").on("click", () => {
            this.declaration2();
        });

    },

    declaration: function () {

        let data = {
            TITLE: $("#TITLE").val(),
            CONTENT: $("#CONTENTS").val(),
            TYPE: $("#HVAL").val(),
            HVAL: $("#TYPE").val(),
            NAME: $("#username").val()

        };

        $.ajax({
            type: "POST",
            url: "/api/declaration",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
        }).done(function (resp) {
            alert("신고&문의완료."+
                "TITLE : "+ data.TITLE+ "-" +
                "CONTENT : "+data.CONTENT+ "-" +
                "TYPE : "+data.TYPE+ "-" +
                "HVAL : "+data.HVAL+ "-" +
                "NAME : "+data.NAME
            );
            // + data.BOARDTYPE +"check:"+ $("#check").is(":checked")
            history.go(0);
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });

    },

    declaration2: function () {

        let data = {
            TITLE: $("#TITLE2").val(),
            CONTENT: $("#CONTENTS2").val(),
            TYPE: $("#HVAL2").val(),
            HVAL: $("#TYPE2").val(),
            NAME: $("#username2").val()

        };

        $.ajax({
            type: "POST",
            url: "/api/declaration",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
        }).done(function (resp) {
            alert("신고&문의완료."+
                "TITLE : "+ data.TITLE+ "-" +
                "CONTENT : "+data.CONTENT+ "-" +
                "TYPE : "+data.TYPE+ "-" +
                "HVAL : "+data.HVAL+ "-" +
                "NAME : "+data.NAME
            );
            // + data.BOARDTYPE +"check:"+ $("#check").is(":checked")
            history.go(0);
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });

    },


    reportT: function(reportId, reportType) {

        $.ajax({
            type: "PUT",
            url: "/api/board/reports/"+reportId+"/Tval/"+reportType,
            dataType: "json",
        }).done(function(resp) {
            alert("문의완료.");
            // +ID4+"-"+ID5+"USERNAME :"+USERNAME+"TITLE:"+TITLE
            history.go(0);
        }).fail(function(error) {
            alert(JSON.stringify(error));
        });

    },

}

index.init();