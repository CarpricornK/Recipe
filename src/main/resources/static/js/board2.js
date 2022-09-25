let index2 = {
    init: function () {
        $("#btn-plan1").on("click", () => {
            this.MPlan();
        });
        $("#btn-declaration").on("click", () => {
            this.declaration();
        });
        $("#btn-declaration2").on("click", () => {
            this.declaration2();
        });

    },

    MPlan: function () {

        let data = {
            PlanTITLE: $("#MENU").val(),
            PlanUSERNAME: $("#Pusername").val(),
            PlanDate: $("#Date").val(),
            PlanKcal: $("#Calorie").val(),
            PlanNa: $("#Nat").val(),
            PlanPro: $("#Protein").val(),
            PlanCarb: $("#Carbohydrate").val(),
            PlanTYPE: $("#type").val()
        };
        $.ajax({
            type: "POST",
            url: "/api/MPlan",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
        }).done(function (resp) {
            alert("식단짜기가 완료되었습니다.");
            // + data.BOARDTYPE +"check:"+ $("#check").is(":checked")
            history.go(0);
        }).fail(function (error) {
            alert(JSON.stringify(error));
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
        let data = {
            TITLE: $("#TITLE2").val(),
        }

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

    // "/api/rboard/"+boardId2+"/delete/"+boardtype,

    MDelete: function(year, month, i) {
        let date = year+'-'+month+'-'+i;

        $.ajax({
            type: "DELETE",
            url: "/api/Mplan/"+date+"/delete",
            dataType: "json"
        }).done(function(resp){
            alert("식단삭제"+date);
            history.go(0);
        }).fail(function(error){
            alert(JSON.stringify(error));
        });

    },

    // API 갤러리 식단짜기
    // index2.MPlan2(${api.content[i].info_CAR}, ${api.content[i].info_PRO}, ${api.content[i].info_NA}, ${api.content[i].info_FAT}, '${i}', '${api.content[i].rcp_NM}')"
    MPlan2: function(CAR, PRO, NA, Kcal, listV, title, time ,username) {

        var valueById = $('#pet-select'+listV).val();

        $.ajax({
            type: "PUT",
            url: "/api/board/MPlan/"+CAR+"/"+PRO+"/"+NA+"/"+Kcal+"/"+valueById+"/"+title+"/"+time+"/"+username+"/",
            dataType: "json",
        }).done(function(resp) {
            alert(
                "CAR:"+CAR + " "+
                "PRO:"+PRO + " "+
                "NA:"+NA + " "+
                "Kcal:"+Kcal + " "+
                "title:"+title + " "+
                "time:"+time + " "+
                "username:"+username + " "+
                "valueById:"+valueById
            )

            alert("식단짜기완료");
            // +ID4+"-"+ID5+"USERNAME :"+USERNAME+"TITLE:"+TITLE
            history.go(0);
        }).fail(function(error) {
            alert(JSON.stringify(error));
        });

    },

}

index2.init();