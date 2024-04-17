let ck_company = document.getElementById("ck_company");
    let ck_person = document.getElementById("ck_person");
    let company1 = document.getElementById("company");
    let person1 = document.getElementById("person1");

let ceo_name_in = document.getElementById("ceo_name_in");
let ceo_phone_in = document.getElementById("ceo_phone_in")
let addr_in = document.getElementById("addr_in");
let sales_name_in = document.getElementById("sales_name_in");
let selectCompany = document.getElementById("inputSelect");

let addr_person_in = document.getElementById("addr_person_in");
let person_name_in = document.getElementById("person_name_in");
let person_phone_in = document.getElementById("person_phone_in");
let person_sales_name_in = document.getElementById("person_sales_name_in");
let person_select = document.getElementById("inputSelectPerson");

let submit_check = document.getElementById("submit_check");

let emp_choice = document.getElementsByClassName("emp_choice");

    selectCompany.addEventListener("change",function(){
        sales_name_in.value = selectCompany.value;
    })
    person_select.addEventListener("change",function(){
        person_sales_name_in.value = person_select.value;
    })
        addr_person_in.disabled=true;
        person_name_in.disabled=true;
        person_phone_in.disabled=true;
        person_sales_name_in.disabled=true;

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
        submit_check.value = "법인";
        console.log(submit_check.value);

        addr_person_in.disabled=true;
        person_name_in.disabled=true;
        person_phone_in.disabled=true;
        person_sales_name_in.disabled=true;

        ceo_name_in.disabled=false;
        ceo_phone_in.disabled=false;
        addr_in.disabled=false;
        sales_name_in.disabled=false;
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
        ceo_name_in.disabled=true;
        ceo_phone_in.disabled=true;
        addr_in.disabled=true;
        sales_name_in.disabled=true;

        addr_person_in.disabled=false;
        person_name_in.disabled=false;
        person_phone_in.disabled=false;
        person_sales_name_in.disabled=false;

        submit_check.value="개인";
        
        console.log(submit_check.value);
    }