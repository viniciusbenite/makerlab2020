function change() {
    var select = document.getElementById("no_team_members");
    var names = document.getElementById("names");
    var value = select.value;
        if (value == 1) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' required>`;  
            names.innerHTML=toAppend;
            return;
        }
        if (value == 2) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' required>`;
            names.innerHTML = toAppend; 
            return;
        }
        if (value == 3) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' required>`;
            names.innerHTML = toAppend;
            return;
        }
        if (value == 4) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student4_name' required>`;
            names.innerHTML = toAppend;
            return;

        }
        if (value == 5) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student4_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student5_name' required>`;
            names.innerHTML = toAppend;
            return;
        }
        if (value == 6) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student4_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student5_name' required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student6_name' required>`;
            names.innerHTML = toAppend;
            return;
        }
}

function ValidateEmail()
{
    var select = document.getElementById("no_team_members");
    var value = select.value;
    var x = document.forms["myForm"]["supervisor_name"].value;
    var mailformat = /^\w+([\.-]?\w+)*@ua.pt/;

    if(value==1){
        var s1 = document.forms["myForm"]["student1_name"].value;
        if(x.match(mailformat) && s1.match(mailformat))
        {
        document.myForm.supervisor_name.focus();
        return true;
        }
        else if(x=="" || s1==""){
            alert("Input all emails");
            document.myForm.supervisor_name.focus();
            return false;
        }
        else
        {
        alert("The e-mail must follow UA pattern!");
        document.myForm.supervisor_name.focus();
        return false;
        }
    }
    else if(value==2){
        var s1 = document.forms["myForm"]["student1_name"].value;
        var s2 = document.forms["myForm"]["student2_name"].value;
        if(x.match(mailformat) && s1.match(mailformat) && s2.match(mailformat))
        {
        document.myForm.supervisor_name.focus();
        return true;
        }
        else if(x=="" || s1=="" || s2==""){
            alert("Input all emails");
            document.myForm.supervisor_name.focus();
            return false;
        }
        else
        {
        alert("The e-mail must follow UA pattern!");
        document.myForm.supervisor_name.focus();
        return false;
        }
    }
    else if(value==3){
        var s1 = document.forms["myForm"]["student1_name"].value;
        var s2 = document.forms["myForm"]["student2_name"].value;
        var s3 = document.forms["myForm"]["student3_name"].value;
        if(x.match(mailformat) && s1.match(mailformat) && s2.match(mailformat) && s3.match(mailformat))
        {
        document.myForm.supervisor_name.focus();
        return true;
        }
        else if(x=="" || s1=="" || s2=="" || s3==""){
            alert("Input all emails");
            document.myForm.supervisor_name.focus();
            return false;
        }
        else
        {
        alert("The e-mail must follow UA pattern!");
        document.myForm.supervisor_name.focus();
        return false;
        }
    }
    else if(value==4){
        var s1 = document.forms["myForm"]["student1_name"].value;
        var s2 = document.forms["myForm"]["student2_name"].value;
        var s3 = document.forms["myForm"]["student3_name"].value;
        var s4 = document.forms["myForm"]["student4_name"].value;
        if(x.match(mailformat) && s1.match(mailformat) && s2.match(mailformat) && s3.match(mailformat) 
        && s4.match(mailformat))
        {
        document.myForm.supervisor_name.focus();
        return true;
        }
        else if(x=="" || s1=="" || s2=="" || s3=="" || s4==""){
            alert("Input all emails");
            document.myForm.supervisor_name.focus();
            return false;
        }
        else
        {
        alert("The e-mail must follow UA pattern!");
        document.myForm.supervisor_name.focus();
        return false;
        }
    }
    else if(value==5){
        var s1 = document.forms["myForm"]["student1_name"].value;
        var s2 = document.forms["myForm"]["student2_name"].value;
        var s3 = document.forms["myForm"]["student3_name"].value;
        var s4 = document.forms["myForm"]["student4_name"].value;
        var s5 = document.forms["myForm"]["student5_name"].value;
        if(x.match(mailformat) && s1.match(mailformat) && s2.match(mailformat) && s3.match(mailformat) 
        && s4.match(mailformat) && s5.match(mailformat))
        {
        document.myForm.supervisor_name.focus();
        return true;
        }
        else if(x=="" || s1=="" || s2=="" || s3=="" || s4=="" || s5==""){
            alert("Input all emails");
            document.myForm.supervisor_name.focus();
            return false;
        }
        else
        {
        alert("The e-mail must follow UA pattern!");
        document.myForm.supervisor_name.focus();
        return false;
        }
    }
    else if(value==6){
        var s1 = document.forms["myForm"]["student1_name"].value;
        var s2 = document.forms["myForm"]["student2_name"].value;
        var s3 = document.forms["myForm"]["student3_name"].value;
        var s4 = document.forms["myForm"]["student4_name"].value;
        var s5 = document.forms["myForm"]["student5_name"].value;
        var s6 = document.forms["myForm"]["student6_name"].value;
        if(x.match(mailformat) && s1.match(mailformat) && s2.match(mailformat) && s3.match(mailformat)
         && s4.match(mailformat) && s5.match(mailformat) && s6.match(mailformat))
        {
        document.myForm.supervisor_name.focus();
        return true;
        }
        else if(x=="" || s1=="" || s2=="" || s3=="" || s4=="" || s5=="" || s6==""){
            alert("Input all emails");
            document.myForm.supervisor_name.focus();
            return false;
        }
        else
        {
        alert("The e-mail must follow UA pattern!");
        document.myForm.supervisor_name.focus();
        return false;
        }
    }
}