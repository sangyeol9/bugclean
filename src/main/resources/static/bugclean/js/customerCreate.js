let ck_company = document.getElementById("ck_company");
    let ck_person = document.getElementById("ck_person");
    let company1 = document.getElementById("company");
    let person1 = document.getElementById("person1");

    function company(){
        if(ck_person.checked){
            ck_person.checked=false;
        }
        if(ck_company.checked){
            company1.classList.remove("none");
            person1.classList.add("none");
        }else{
            
            ck_company.checked=true;
        }
    }

    function person(){
        if(ck_company.checked){
            ck_company.checked=false;
        }
        console.log("person = " + ck_person.checked);
        if(ck_person.checked){
            company1.classList.add("none");
            person1.classList.remove("none");
            console.log("checked");
        }else{
            ck_person.checked=true;
            
        }
    }