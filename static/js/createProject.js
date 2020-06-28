function change() {
    var select = document.getElementById("no_team_members");
    var names = document.getElementById("names");
    var value = select.value;
        if (value == 1) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;  
            names.innerHTML=toAppend;
            return;
        }
        if (value == 2) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;
            names.innerHTML = toAppend; 
            return;
        }
        if (value == 3) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;
            names.innerHTML = toAppend;
            return;
        }
        if (value == 4) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student4_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;
            names.innerHTML = toAppend;
            return;

        }
        if (value == 5) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student4_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student5_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;
            names.innerHTML = toAppend;
            return;
        }
        if (value == 6) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student4_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student5_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student6_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;
            names.innerHTML = toAppend;
            return;
        }
}



document.getElementById('create_project').addEventListener('submit', addProject);

function addProject(){
    const xhr = new XMLHttpRequest();

    var data = 
    {
        code: document.getElementById('project_code').value,
        short_name: document.getElementById('project_short_name').value,
        name: document.getElementById('project_name').value,
        year: document.getElementById('year').value,
        semester: document.getElementById('semester').value,
        equipment: [12]
    }
    
    xhr.open('POST', getProjectsURL);

    if(data){
         xhr.setRequestHeader('Content-type', 'application/json');
    }
   
    xhr.onload = function(){
        console.log(this.responseText);
    }

    xhr.send(JSON.stringify(data));

}
